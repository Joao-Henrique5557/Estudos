#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v python3 >/dev/null 2>&1; then
    printf 'Erro: este script precisa do Python 3. Instale-o e tente novamente.\n' >&2
    exit 1
fi

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
    cat <<'EOF'
Localizador de estudos

Uso:
  ./estudar.sh "o que você quer estudar"
  ./estudar.sh                  # abre busca interativa

Exemplos:
  ./estudar.sh "como calcular desconto e juros"
  ./estudar.sh "conta de luz e consumo de energia"
  ./estudar.sh "revolução industrial"
  ./estudar.sh "quero estudar isso para o ENEM: ecologia"

A busca é local e não usa API, conta ou conexão com serviços de IA.
EOF
    exit 0
fi

exec 3<&0
python3 - "$ROOT" "$@" <<'PY'
from collections import Counter
from difflib import SequenceMatcher
from pathlib import Path
import math
import os
import re
import subprocess
import sys
import unicodedata

PROJECT = Path(sys.argv[1])
PROMPT_INPUT = os.fdopen(3)
AREAS = (
    ("ENEM", PROJECT / "Ensino geral" / "ENEM"),
    ("EnsinoMedio", PROJECT / "Ensino geral" / "EnsinoMedio"),
)
STOP_WORDS = set("""
    a as ao aos aquela aquelas aquele aqueles aquilo com como da das de
    dela delas dele deles do dos e ela elas ele eles em essa essas esse
    esses esta estas este estes eu foi isso isto mais mas meu minha meus
    minhas na nas nem no nos nossa nossas nosso nossos o os ou para pela
    pelas pelo pelos por qual quando que quem se sem seu seus sua suas
    tambem te tem ter todo todos um uma umas uns voce voces quero preciso
    preciso estudar estudo aprender entender revisar sobre assunto materia nao
    enem ensino medio fundamental curriculo completo
    conteudo topico tema onde acho encontrar procurar procurar
""".split())

# Expande expressões comuns para os nomes usados nos mapas de estudo.
ALIASES = {
    "conta de luz": {"eletricidade", "consumo", "potencia", "kwh", "energia"},
    "conta de energia": {"eletricidade", "consumo", "potencia", "kwh"},
    "conta de agua": {"agua", "saneamento", "hidrografia"},
    "conta de internet": {"redes", "internet", "privacidade"},
    "conta de telefone": {"redes", "internet", "comunicacao"},
    "revolucao industrial": {"revolucoes", "industrializacao", "trabalho", "capitalismo", "historia"},
    "revolução industrial": {"revolucoes", "industrializacao", "trabalho", "capitalismo", "historia"},
    "aparelho eletrico": {"eletricidade", "potencia", "consumo"},
    "gasto de energia": {"eletricidade", "potencia", "consumo", "kwh"},
    "quanto pago": {"porcentagem", "juros", "matematica financeira"},
    "desconto": {"porcentagem", "aumentos", "juros", "matematica financeira"},
    "percentual": {"porcentagem", "descontos", "matematica financeira"},
    "percentagem": {"porcentagem", "descontos", "matematica financeira"},
    "promocao": {"porcentagem", "descontos", "matematica financeira"},
    "emprestimo": {"juros", "matematica financeira", "porcentagem"},
    "financiamento": {"juros", "matematica financeira", "porcentagem"},
    "regra de tres": {"proporcoes", "proporcionalidade", "razoes"},
    "regra de três": {"proporcoes", "proporcionalidade", "razoes"},
    "grafico": {"graficos", "estatistica", "interpretacao"},
    "gráfico": {"graficos", "estatistica", "interpretacao"},
    "vacina": {"vacinacao", "imunidade", "saude"},
    "doenca": {"doencas", "saude", "prevencao"},
    "doença": {"doencas", "saude", "prevencao"},
    "mudanca climatica": {"mudancas climaticas", "ambiente", "ecologia"},
    "mudança climática": {"mudancas climaticas", "ambiente", "ecologia"},
    "mudancas climaticas": {"ambiente", "ecologia", "clima"},
    "evolucao": {"evolutivas", "selecao natural", "biologia"},
    "evolução": {"evolutivas", "selecao natural", "biologia"},
    "fotossintese": {"metabolismo", "bioquimica", "botanica", "celular"},
    "fotossíntese": {"metabolismo", "bioquimica", "botanica", "celular"},
    "poema": {"poesia", "literatura", "leitura literaria"},
    "poemas": {"poesia", "literatura", "leitura literaria"},
    "poesia": {"poema", "literatura", "leitura literaria"},
    "planta": {"botanica", "biologia", "fotossintese"},
    "plantas": {"botanica", "biologia", "fotossintese"},
    "conta matematica": {"equacoes", "matematica"},
}


def normalize(text):
    text = unicodedata.normalize("NFKD", text.casefold())
    return "".join(char for char in text if not unicodedata.combining(char))


def tokenize(text):
    words = []
    for word in re.findall(r"[a-z0-9]+", normalize(text)):
        if word in STOP_WORDS or len(word) <= 1:
            continue
        if len(word) > 5 and word.endswith("coes"):
            word = word[:-4] + "cao"
        elif len(word) > 4 and word.endswith("oes"):
            word = word[:-3] + "ao"
        elif len(word) > 5 and word.endswith("ais"):
            word = word[:-3] + "al"
        elif len(word) > 5 and word.endswith("eis"):
            word = word[:-3] + "el"
        elif len(word) > 6 and word.endswith("izacao"):
            word = word[:-6]
        elif len(word) > 4 and word.endswith("s"):
            word = word[:-1]
        words.append(word)
    return words


def subject_summary(area_root, subject):
    path = area_root / subject / "readme.md"
    try:
        return path.read_text(encoding="utf-8")
    except OSError:
        return ""


def build_index():
    documents = []
    for area, area_root in AREAS:
        if not area_root.is_dir():
            continue
        for subject_root in sorted(p for p in area_root.iterdir() if p.is_dir()):
            summary = subject_summary(area_root, subject_root.name)
            for folder in sorted(p for p in subject_root.rglob("*") if p.is_dir()):
                relative = folder.relative_to(PROJECT)
                parts = relative.parts
                if len(parts) < 4:
                    continue
                if any(part.startswith(".") for part in parts):
                    continue
                path_text = " ".join(parts[1:])
                path_terms = Counter(tokenize(path_text))
                if not path_terms:
                    continue
                documents.append({
                    "area": area,
                    "path": folder,
                    "relative": relative,
                    "label": path_text.replace("/", " > "),
                    "path_terms": path_terms,
                    "summary_terms": Counter(tokenize(summary)),
                })
    return documents


def phrase_expansions(query):
    normalized = normalize(query)
    result = set()
    for phrase, additions in ALIASES.items():
        normalized_phrase = re.escape(normalize(phrase)).replace(r"\ ", r"\s+")
        if re.search(rf"(?<![a-z0-9]){normalized_phrase}(?![a-z0-9])", normalized):
            result.update(token for item in additions for token in tokenize(item))
    return result


def make_field_stats(documents, field):
    frequencies = Counter()
    lengths = []
    for document in documents:
        terms = document[field]
        lengths.append(sum(terms.values()))
        frequencies.update(terms.keys())
    return frequencies, sum(lengths) / max(len(lengths), 1)


def bm25(term, terms, doc_count, doc_freq, average_length):
    frequency = terms.get(term, 0)
    if not frequency:
        return 0.0
    length = sum(terms.values())
    inverse_frequency = math.log(1 + (doc_count - doc_freq + 0.5) / (doc_freq + 0.5))
    k1, b = 1.2, 0.75
    normalization = frequency + k1 * (1 - b + b * length / max(average_length, 1))
    return inverse_frequency * frequency * (k1 + 1) / normalization


def rank(query, documents):
    query_terms = set(tokenize(query))
    normalized_query = normalize(query)
    if re.search(r"\bconta\s+(?:de\s+)?luz\b", normalized_query):
        query_terms.discard("conta")
        query_terms.discard("luz")
    expanded_terms = phrase_expansions(query)
    if not query_terms and not expanded_terms:
        return []

    path_df, path_avg = make_field_stats(documents, "path_terms")
    summary_df, summary_avg = make_field_stats(documents, "summary_terms")
    corpus_size = len(documents)
    track_hint = normalize(query)
    prefer_enem = "enem" in track_hint
    prefer_full = any(word in track_hint for word in ("ensino medio", "ensino fundamental", "curriculo", "completo"))

    results = []
    for document in documents:
        score = 0.0
        matched = set()
        path_matched = False
        all_path_terms = document["path_terms"]
        all_summary_terms = document["summary_terms"]

        for term in query_terms:
            path_match = bm25(term, all_path_terms, corpus_size, path_df[term], path_avg)
            summary_match = bm25(term, all_summary_terms, corpus_size, summary_df[term], summary_avg)
            if path_match:
                score += path_match * 3.0
                matched.add(term)
                path_matched = True
            if summary_match:
                score += summary_match * 0.18
                matched.add(term)

        for term in expanded_terms - query_terms:
            path_match = bm25(term, all_path_terms, corpus_size, path_df[term], path_avg)
            summary_match = bm25(term, all_summary_terms, corpus_size, summary_df[term], summary_avg)
            if path_match:
                score += path_match * 1.35
                matched.add(term)
                path_matched = True
            if summary_match:
                score += summary_match * 0.08

        # Catch small spelling variations without requiring a stemming package.
        if score == 0:
            candidates = set(all_path_terms)
            for term in query_terms:
                if len(term) < 5:
                    continue
                closest = max(
                    ((SequenceMatcher(None, term, candidate).ratio(), candidate)
                     for candidate in candidates),
                    default=(0, ""),
                )
                if closest[0] >= 0.94:
                    score += bm25(
                        closest[1], all_path_terms, corpus_size,
                        path_df[closest[1]], path_avg,
                    ) * 0.75
                    matched.add(closest[1])
                    path_matched = True

        if prefer_enem and document["area"] == "ENEM":
            score += 0.5
        if prefer_full and document["area"] == "EnsinoMedio":
            score += 0.5

        if score > 0:
            results.append((score, len(document["relative"].parts), document, matched, path_matched))

    if any(row[4] for row in results):
        results = [row for row in results if row[4]]
    best_by_area = {
        area: max((row[0] for row in results if row[2]["area"] == area), default=0)
        for area, _ in AREAS
    }
    results = [
        row for row in results
        if row[0] >= best_by_area[row[2]["area"]] * 0.55
    ]
    results.sort(key=lambda row: (-row[0], -row[1], str(row[2]["relative"]).casefold()))
    return results


def search(query, documents):
    results = rank(query, documents)
    if not results:
        print("Não encontrei uma pasta correspondente. Tente incluir a matéria ou um termo do assunto.")
        return False

    print(f"\nSugestões para: {query}\n")
    choices = []
    for area in ("ENEM", "EnsinoMedio"):
        matching_area = [row for row in results if row[2]["area"] == area][:3]
        if not matching_area:
            continue
        title = "Foco na prova" if area == "ENEM" else "Mapa completo do Ensino Médio"
        print(f"{title}:")
        for _, _, document, _, _ in matching_area:
            choices.append(document)
            print(f"  {len(choices)}. {document['label']}")
            print(f"  {document['path']}")
        print()
    return select_folder(choices)


def read_input(prompt):
    print(prompt, end="", flush=True)
    line = PROMPT_INPUT.readline()
    if not line:
        raise EOFError
    return line.rstrip("\r\n")


def select_folder(choices):
    while True:
        try:
            selection = read_input(
                "Digite o número da pasta para abrir (Enter para cancelar): "
            ).strip()
        except (EOFError, KeyboardInterrupt):
            print()
            return False
        if not selection:
            return False
        if selection.isdecimal() and 1 <= int(selection) <= len(choices):
            folder = choices[int(selection) - 1]["path"]
            try:
                subprocess.run(["code", str(folder)], check=True)
            except FileNotFoundError:
                print("Erro: o comando 'code' não foi encontrado. Instale o VS Code ou habilite-o no PATH.", file=sys.stderr)
                return False
            except subprocess.CalledProcessError as error:
                print(f"Erro: não foi possível abrir a pasta no VS Code (código {error.returncode}).", file=sys.stderr)
                return False
            return True
        print(f"Opção inválida. Digite um número entre 1 e {len(choices)} ou pressione Enter para cancelar.")


def main():
    documents = build_index()
    if not documents:
        print("Erro: não encontrei pastas de tópicos em Ensino geral/ENEM ou Ensino geral/EnsinoMedio.", file=sys.stderr)
        return 1

    initial_query = " ".join(sys.argv[2:]).strip()
    if initial_query:
        search(initial_query, documents)
        return 0

    print("Localizador de estudos (busca local; digite 'sair' para encerrar)")
    while True:
        try:
            query = read_input("\nO que você quer estudar? ").strip()
        except (EOFError, KeyboardInterrupt):
            print()
            return 0
        if normalize(query) in {"sair", "exit", "quit", "q"}:
            return 0
        if query:
            search(query, documents)


if __name__ == "__main__":
    raise SystemExit(main())
PY
