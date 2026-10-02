# Como garantir que todo o conteúdo do Ensino Fundamental e Médio seja estudado

## 1. Objetivo

O objetivo deste projeto é construir uma **cobertura completa e verificável dos conhecimentos da Educação Básica**, desde o Ensino Fundamental até o Ensino Médio.

A ideia não é simplesmente estudar o que aparece em uma plataforma como Khan Academy, nem seguir uma lista aleatória de matérias.

O objetivo é responder:

> **"Como posso ter certeza de que não deixei conteúdos importantes para trás?"**

Para isso, este mapa deve funcionar como um **índice central de conhecimentos**, enquanto diferentes fontes são utilizadas para estudar cada conteúdo.

---

# 2. Não utilizar uma única fonte como currículo

Nenhuma plataforma deve ser considerada automaticamente como a representação completa do Ensino Fundamental e Médio.

Exemplos:

- Khan Academy
- YouTube
- livros didáticos
- cursos preparatórios
- sites educacionais
- apostilas
- materiais de vestibulares

Esses recursos devem ser tratados como **fontes de estudo**, e não necessariamente como a definição do que precisa ser estudado.

A estrutura principal deve vir de documentos curriculares e de uma comparação entre diferentes referências.

```text
DOCUMENTOS CURRICULARES
        ↓
MAPA DE CONHECIMENTOS
        ↓
CONTEÚDOS / ASSUNTOS
        ↓
RECURSOS DE ESTUDO
        ↓
EXERCÍCIOS
        ↓
AVALIAÇÃO
        ↓
DOMÍNIO
```

---

# 3. Usar a BNCC como uma das referências principais

A primeira referência deve ser a **Base Nacional Comum Curricular (BNCC)**.

Ela permite verificar quais competências e habilidades fazem parte da Educação Básica brasileira.

Porém:

> A BNCC não deve ser transformada diretamente em uma lista de aulas.

Ela deve funcionar como uma **camada de verificação curricular**.

Por exemplo:

```text
BNCC
│
├── Competência
│
├── Habilidade
│
└── Conhecimento relacionado
         ↓
    MAPA DE ESTUDOS
         ↓
    ASSUNTO
         ↓
    SUBASSUNTOS
```

Isso evita confundir:

**habilidade curricular**

com

**tópico de estudo**.

---

# 4. Separar currículo de conteúdo

O projeto deve distinguir três coisas:

## 4.1 O que é obrigatório no currículo

Aquilo que aparece nas referências curriculares.

Exemplo:

```text
Matemática
└── Funções
```

---

## 4.2 O que é necessário como pré-requisito

Alguns conhecimentos podem não aparecer como um tópico isolado, mas são necessários para compreender outros.

Exemplo:

```text
Frações
   ↓
Equações
   ↓
Funções
   ↓
Física
```

Portanto, o mapa deve incluir também:

> **conhecimentos necessários para aprender outros conhecimentos.**

---

## 4.3 Conhecimentos adicionais

O estudante também pode querer estudar conteúdos que vão além do currículo.

Exemplo:

```text
Ensino Médio
│
└── Matemática
     │
     ├── Conteúdo curricular
     │
     └── Matemática adicional
          ├── Cálculo
          ├── Álgebra linear
          └── Matemática discreta
```

Esses conteúdos não devem ser confundidos com aquilo que é exigido pela Educação Básica.

---

# 5. Criar uma matriz de cobertura

A maneira mais importante de verificar se o conteúdo foi coberto é utilizar uma **matriz de cobertura**.

Exemplo:

| Área       | Conteúdo       | Fonte curricular      | Estudado | Exercitado | Avaliado | Dominado |
| ---------- | -------------- | --------------------- | -------- | ---------- | -------- | -------- |
| Matemática | Frações        | BNCC                  | ✅       | ✅         | ✅       | 🟢       |
| Matemática | Equações       | BNCC                  | ✅       | ✅         | ❌       | 🟡       |
| Física     | Cinemática     | Referência curricular | ❌       | ❌         | ❌       | ⬜       |
| Química    | Estequiometria | Referência curricular | 🟡       | ❌         | ❌       | 🟡       |

Um conteúdo **não deve ser considerado concluído apenas porque uma aula foi assistida**.

---

# 6. Definir o que significa "estudei"

Utilizar os seguintes níveis:

```text
⬜ NÃO INICIADO
        ↓
🔵 CONTACTADO
        ↓
🟡 ESTUDANDO
        ↓
🟠 EXERCITADO
        ↓
🟣 AVALIADO
        ↓
🟢 DOMINADO
```

## ⬜ Não iniciado

Nunca estudei o conteúdo.

---

## 🔵 Contactado

Já tive contato com o conteúdo, mas ainda não consigo utilizá-lo sozinho.

Exemplo:

> Assisti a uma aula sobre a Lei de Newton.

Isso **não significa domínio**.

---

## 🟡 Estudando

Já compreendi os conceitos básicos e estou praticando.

---

## 🟠 Exercitado

Consigo resolver exercícios relacionados ao conteúdo.

---

## 🟣 Avaliado

Fiz uma avaliação ou conjunto de questões sem consultar o material.

---

## 🟢 Dominado

Consigo:

- explicar o conceito;
- resolver exercícios;
- aplicar o conhecimento em situações diferentes;
- relacionar o conteúdo com outros assuntos;
- identificar quando o conhecimento deve ser utilizado.

---

# 7. Não estudar somente por matéria

Evitar uma organização como:

```text
Física
├── estudar
├── estudar
└── estudar
```

Preferir:

```text
Física
│
├── Mecânica
│   │
│   ├── Cinemática
│   │   ├── Movimento
│   │   ├── Velocidade
│   │   └── Aceleração
│   │
│   └── Dinâmica
│       ├── Forças
│       ├── Leis de Newton
│       └── Atrito
│
└── Termologia
    ├── Temperatura
    ├── Calor
    └── Termodinâmica
```

Quanto maior a profundidade do mapa, menor a chance de esquecer partes importantes.

---

# 8. Utilizar várias referências

Nenhuma fonte deve ser considerada suficiente sem verificação.

Para cada área importante, comparar:

### Referência 1 — currículo oficial

Verifica:

> O assunto faz parte da Educação Básica?

### Referência 2 — currículo escolar

Verifica:

> Como o assunto costuma ser organizado e distribuído?

### Referência 3 — material didático

Verifica:

> Quais conceitos e subassuntos normalmente são ensinados?

### Referência 4 — vestibulares/ENEM

Verifica:

> Como esse conhecimento é cobrado?

### Referência 5 — fonte de aprofundamento

Verifica:

> Existe algum conhecimento importante que normalmente fica fora de materiais básicos?

---

# 9. Fazer uma auditoria de cada disciplina

Depois de montar uma disciplina, fazer uma auditoria.

Exemplo:

```text
MATEMÁTICA

[✓] Currículo oficial consultado
[✓] Livro didático consultado
[✓] Currículo de outras referências consultado
[✓] ENEM consultado
[ ] Vestibulares consultados
[ ] Conteúdos avançados verificados
```

Somente depois disso considerar o mapa da disciplina como uma versão confiável.

---

# 10. Procurar divergências

Quando duas fontes apresentarem estruturas diferentes, não escolher automaticamente uma delas.

Registrar a diferença.

Exemplo:

```text
Fonte A:
Funções
├── Afim
├── Quadrática
└── Exponencial

Fonte B:
Funções
├── Afim
├── Quadrática
├── Modular
├── Exponencial
└── Logarítmica
```

Nesse caso:

```text
FUNÇÕES
├── Afim
├── Quadrática
├── Modular
├── Exponencial
└── Logarítmica
```

Depois verificar:

> Por que a fonte A não possui função modular?

A diferença pode existir porque:

- o conteúdo pertence a outra etapa;
- é considerado pré-requisito;
- é opcional;
- a fonte simplificou a organização;
- o currículo mudou;
- a fonte possui uma proposta diferente.

---

# 11. Criar uma lista de "conteúdos suspeitos"

Sempre que surgir um assunto que não esteja no mapa, colocá-lo temporariamente nesta lista.

```markdown
# Conteúdos para investigar

- [ ] Assunto X
- [ ] Assunto Y
- [ ] Assunto Z
```

Depois classificar:

```text
Assunto encontrado
       ↓
Está no currículo?
   ↙        ↘
 SIM        NÃO
 ↓           ↓
Adicionar   Verificar
ao mapa     se é pré-requisito
            ou conteúdo adicional
```

Isso evita perder conhecimentos encontrados durante os estudos.

---

# 12. Verificar pré-requisitos

Um dos maiores riscos de um mapa curricular é listar os assuntos sem mostrar suas dependências.

Exemplo:

```text
Aritmética
    ↓
Frações
    ↓
Álgebra
    ↓
Equações
    ↓
Funções
    ↓
Trigonometria
    ↓
Física
```

Ao encontrar dificuldade em um conteúdo, procurar primeiro os pré-requisitos.

Exemplo:

```text
Não consigo entender:
        ↓
Equação de movimento
        ↓
Tenho dificuldade em:
        ↓
Álgebra
        ↓
Tenho dificuldade em:
        ↓
Equações do 1º grau
```

Nesse caso, não adianta simplesmente procurar uma explicação diferente de Física.

É necessário voltar no mapa.

---

# 13. Fazer avaliações independentes

Uma fonte de estudo não deve ser responsável por dizer sozinha se você aprendeu.

Exemplo ruim:

```text
Assistiu à aula
      ↓
Plataforma marcou como concluído
      ↓
Conteúdo considerado aprendido
```

Preferir:

```text
Estudo
  ↓
Exercícios
  ↓
Questões diferentes
  ↓
Teste sem consulta
  ↓
Resultado
  ↓
Revisão
```

---

# 14. Utilizar questões de diferentes fontes

Depois de estudar um assunto, resolver questões de fontes diferentes.

Exemplo:

```text
Conteúdo:
Leis de Newton

        ↓

Exercícios do material utilizado
        +
Questões de livro
        +
Questões de vestibular
        +
Questões do ENEM
```

Isso reduz a possibilidade de apenas ter aprendido a resolver os exercícios de uma determinada plataforma.

---

# 15. Fazer auditorias periódicas

O mapa deve ser revisado regularmente.

## Auditoria mensal

Perguntar:

- Estou deixando disciplinas de lado?
- Existem assuntos sem fonte?
- Existem assuntos sem exercícios?
- Existem assuntos que marquei como dominados sem avaliação?
- Descobri novos conteúdos?
- Existem pré-requisitos faltando?

---

## Auditoria por disciplina

Quando terminar uma disciplina:

```text
[ ] Currículo conferido
[ ] Conteúdos listados
[ ] Subassuntos listados
[ ] Pré-requisitos identificados
[ ] Fontes encontradas
[ ] Exercícios encontrados
[ ] Avaliação realizada
[ ] Lacunas identificadas
```

---

# 16. Nunca marcar tudo como "dominado" automaticamente

O progresso deve representar **conhecimento real**, não apenas progresso na plataforma.

Por exemplo:

```text
Khan Academy:
████████████████████ 100%

Conhecimento real:
██████████████░░░░░░ 70%
```

O primeiro mede conclusão do material.

O segundo mede domínio.

São coisas diferentes.

---

# 17. Criar uma segunda camada para o ENEM

O currículo escolar e o ENEM não são exatamente a mesma coisa.

Por isso, depois de construir o mapa escolar:

```text
EDUCAÇÃO BÁSICA
       ↓
MAPA CURRICULAR
       ↓
MAPA DE CONHECIMENTOS
       ↓
MAPA ENEM
```

O mapa do ENEM deve mostrar quais conhecimentos são mais relevantes para a prova.

Isso permite estudar primeiro o que possui maior prioridade sem apagar conteúdos menos frequentes.

---

# 18. Criar uma terceira camada para objetivos pessoais

Depois do currículo:

```text
CURRÍCULO
    ↓
ENEM
    ↓
UNIVERSIDADE
    ↓
OBJETIVOS PROFISSIONAIS
```

Por exemplo, para Ciência da Computação:

```text
Matemática
├── Álgebra
├── Funções
├── Probabilidade
├── Estatística
├── Matemática discreta
└── Cálculo

Computação
├── Algoritmos
├── Estruturas de dados
├── Sistemas operacionais
├── Redes
├── Banco de dados
└── Arquitetura de computadores
```

Assim, o mapa não termina no Ensino Médio.

---

# 19. Estrutura final do projeto

Uma estrutura recomendada:

```text
MAPA-DE-ESTUDOS/
│
├── README.md
│
├── 01-FUNDAMENTAL/
│   ├── matematica.md
│   ├── ciencias.md
│   ├── portugues.md
│   ├── historia.md
│   ├── geografia.md
│   └── ingles.md
│
├── 02-ENSINO-MEDIO/
│   ├── matematica.md
│   ├── fisica.md
│   ├── quimica.md
│   ├── biologia.md
│   ├── portugues.md
│   ├── literatura.md
│   ├── historia.md
│   ├── geografia.md
│   ├── filosofia.md
│   ├── sociologia.md
│   └── ingles.md
│
├── 03-ENEM/
│   ├── linguagens.md
│   ├── matematica.md
│   ├── ciencias-humanas.md
│   └── ciencias-natureza.md
│
├── 04-COMPUTACAO/
│   ├── fundamentos.md
│   ├── programacao.md
│   ├── algoritmos.md
│   └── ciencia-da-computacao.md
│
├── 05-RECURSOS/
│   └── recursos.md
│
├── 06-REVISOES/
│   └── revisoes.md
│
└── 07-AUDITORIA/
    ├── cobertura.md
    ├── lacunas.md
    └── fontes-consultadas.md
```

---

# 20. Critério final de completude

Um conteúdo somente pode ser considerado **coberto** quando:

```text
              CONTEÚDO
                  │
                  ▼
        ┌──────────────────┐
        │ Está no currículo│
        │ ou foi justificado│
        │ como adicional?  │
        └────────┬─────────┘
                 │
                 ▼
          Foi estudado?
                 │
                 ▼
        Foi praticado?
                 │
                 ▼
        Foi avaliado?
                 │
                 ▼
       Consigo aplicar?
                 │
                 ▼
           🟢 DOMINADO
```

E a disciplina somente pode ser considerada **auditada** quando:

- [ ] As referências curriculares foram consultadas
- [ ] Mais de uma fonte foi comparada
- [ ] Os conteúdos foram divididos em subassuntos
- [ ] Os pré-requisitos foram identificados
- [ ] Conteúdos divergentes foram investigados
- [ ] Existem fontes de estudo
- [ ] Existem exercícios
- [ ] Existem avaliações
- [ ] As lacunas foram registradas
- [ ] O mapa foi revisado

---

# 21. Regra principal

> **O mapa define o que estudar. As fontes ensinam. Os exercícios praticam. As avaliações verificam.**

Não utilizar uma plataforma específica como garantia de completude.

O objetivo deste projeto é fazer com que seja possível olhar para o mapa e responder objetivamente:

> **"Quais conhecimentos da Educação Básica eu já estudei, quais ainda faltam e quais eu realmente domino?"**
