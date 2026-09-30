


















# Bash — Conceitos básicos usados no script

Este material explica os conceitos necessários para entender e corrigir o script de seleção de projetos.

---

## 1. Variáveis no Bash

Uma variável guarda um valor.

```bash
nome="João"
idade=18
```

Para acessar o valor da variável, usamos `$`:

```bash
echo "$nome"
echo "$idade"
```

Resultado:

```text
João
18
```

### Importante

Ao **criar** a variável:

```bash
nome="João"
```

Não usamos `$`.

Ao **usar** a variável:

```bash
echo "$nome"
```

Usamos `$`.

---

# 2. Aspas não executam comandos

Esse foi um dos principais problemas do seu script.

Você escreveu algo parecido com:

```bash
projeto="awk '{print $2}' listaProjetos.txt"
```

O Bash entende isso como:

> "A variável `projeto` deve receber exatamente este texto."

Ou seja, `awk` **não é executado**.

A variável recebe:

```text
awk '{print $2}' listaProjetos.txt
```

## Como executar um comando e guardar o resultado?

Usamos:

```bash
$(comando)
```

Por exemplo:

```bash
projeto=$(awk '{print $2}' listaProjetos.txt)
```

Agora o Bash:

1. executa o `awk`;
2. pega o resultado;
3. coloca o resultado dentro de `projeto`.

---

# 3. `$()` — substituição de comando

O nome desse conceito é **command substitution**.

Exemplo:

```bash
data=$(date)
```

O comando:

```bash
date
```

é executado.

O resultado é colocado na variável:

```bash
data
```

Outro exemplo:

```bash
arquivos=$(ls)
```

Agora `arquivos` contém o resultado do `ls`.

---

# 4. Diferença entre texto e comando

Compare:

```bash
comando="date"
```

Aqui:

```text
comando
↓
"date"
```

É apenas texto.

Agora:

```bash
resultado=$(date)
```

Aqui:

```text
date
↓
executa
↓
resultado
```

Essa diferença é muito importante em Bash.

---

# 5. `awk`

O `awk` é muito usado para trabalhar com texto organizado em linhas e colunas.

Imagine:

```text
1, /home/joao/projetos/site
2, /home/joao/projetos/api
3, /home/joao/projetos/app
```

Podemos usar:

```bash
awk '{print $1}' arquivo.txt
```

Para pegar a primeira coluna.

E:

```bash
awk '{print $2}' arquivo.txt
```

Para pegar a segunda coluna.

---

# 6. O significado de `$1`, `$2`, `$3` no `awk`

Dentro do `awk`:

```bash
$1
```

significa primeira coluna.

```bash
$2
```

segunda coluna.

```bash
$3
```

terceira coluna.

Por exemplo:

```text
João 18 Alagoas
Maria 20 Bahia
Carlos 25 Sergipe
```

Com:

```bash
awk '{print $1}' arquivo.txt
```

temos:

```text
João
Maria
Carlos
```

Com:

```bash
awk '{print $2}' arquivo.txt
```

temos:

```text
18
20
25
```

Com:

```bash
awk '{print $3}' arquivo.txt
```

temos:

```text
Alagoas
Bahia
Sergipe
```

---

# 7. Cuidado: `$1` no Bash e `$1` no `awk`

Eles podem parecer iguais, mas são coisas diferentes.

No Bash:

```bash
echo "$1"
```

`$1` normalmente representa o **primeiro argumento passado para o script**.

Exemplo:

```bash
./script.sh teste
```

Dentro do script:

```bash
$1
```

será:

```text
teste
```

Já dentro do `awk`:

```bash
awk '{print $1}' arquivo.txt
```

`$1` significa:

> primeira coluna da linha atual.

---

# 8. `sed`

O `sed` pode ser usado para selecionar linhas.

Para mostrar a terceira linha:

```bash
sed -n '3p' arquivo.txt
```

Onde:

```text
3
```

é a linha.

E:

```text
p
```

significa imprimir.

Para mostrar a primeira linha:

```bash
sed -n '1p' arquivo.txt
```

Para mostrar a quinta:

```bash
sed -n '5p' arquivo.txt
```

---

# 9. Variável dentro do `sed`

Imagine:

```bash
count=3
```

Você pode fazer:

```bash
sed -n "${count}p" arquivo.txt
```

O Bash substitui:

```text
${count}
```

por:

```text
3
```

Então o comando executado será:

```bash
sed -n '3p' arquivo.txt
```

---

# 10. Por que `$countp` não funciona como esperado?

Imagine:

```bash
count=3
```

Você poderia tentar:

```bash
sed -n "$countp" arquivo.txt
```

O Bash pode interpretar o nome da variável como:

```text
countp
```

e não como:

```text
count + p
```

Por isso usamos:

```bash
"${count}p"
```

As chaves deixam claro onde termina o nome da variável.

---

# 11. `for`

O `for` repete uma ação para vários valores.

Exemplo:

```bash
for numero in 1 2 3 4; do
    echo "$numero"
done
```

Resultado:

```text
1
2
3
4
```

A cada repetição, `numero` recebe um valor diferente.

---

# 12. `for` com arquivos

No seu script você tinha:

```bash
for projeto in "$pastaProjetos"/*; do
```

Isso significa:

> Para cada item dentro de `$pastaProjetos`, execute o código.

Por exemplo, se:

```text
/home/joao/projetos/
├── site
├── api
└── aplicativo
```

Então o `for` passará por:

```text
/home/joao/projetos/site
/home/joao/projetos/api
/home/joao/projetos/aplicativo
```

A cada repetição:

```bash
$projeto
```

contém um desses caminhos.

---

# 13. `read`

`read` permite receber uma informação digitada pelo usuário.

Exemplo:

```bash
read nome
```

Se o usuário digitar:

```text
João
```

a variável `nome` receberá:

```text
João
```

Podemos usar:

```bash
echo "$nome"
```

---

# 14. `read -p`

Podemos mostrar uma mensagem diretamente no `read`:

```bash
read -p "Digite seu nome: " nome
```

O usuário verá:

```text
Digite seu nome:
```

Depois que ele digitar:

```text
João
```

a variável terá:

```bash
$nome
```

com o valor:

```text
João
```

---

# 15. `if`

O `if` verifica uma condição.

Exemplo:

```bash
if [ "$idade" -ge 18 ]; then
    echo "Maior de idade"
fi
```

Estrutura:

```bash
if [ condição ]; then
    comandos
fi
```

---

# 16. Comparação de números

Para números, existem operadores específicos.

| Operador | Significado |
|---|---|
| `-eq` | igual |
| `-ne` | diferente |
| `-gt` | maior que |
| `-ge` | maior ou igual |
| `-lt` | menor que |
| `-le` | menor ou igual |

Exemplo:

```bash
if [ "$idade" -ge 18 ]; then
    echo "Maior ou igual a 18"
fi
```

---

# 17. Comparação de texto

Para comparar textos, usamos normalmente:

```bash
=
```

ou:

```bash
!=
```

Exemplo:

```bash
if [ "$input" = "quit" ]; then
    echo "Saindo..."
fi
```

Aqui estamos comparando:

```text
input
↓
quit
```

---

# 18. `$` nas variáveis dentro do `if`

Você escreveu:

```bash
if [ input -eq numero ]; then
```

Nesse caso, o Bash interpreta `input` e `numero` como textos literais.

Para usar as variáveis:

```bash
if [ "$input" -eq "$numero" ]; then
```

Agora o Bash pega os valores armazenados nelas.

Por exemplo:

```bash
input=2
numero=2
```

O Bash verá:

```bash
if [ "2" -eq "2" ]; then
```

---

# 19. `while`

O `while` repete enquanto uma condição for verdadeira.

Exemplo:

```bash
num=1

while [ "$num" -le 4 ]; do
    echo "$num"
    num=$((num + 1))
done
```

Resultado:

```text
1
2
3
4
```

---

# 20. `break`

`break` interrompe o loop.

Exemplo:

```bash
while true; do

    read input

    if [ "$input" = "quit" ]; then
        break
    fi

done
```

Quando o usuário digitar:

```text
quit
```

o `break` encerra o `while`.

---

# 21. `>>` e `>`

Esses operadores são importantes no seu script.

## `>`

Sobrescreve o arquivo:

```bash
echo "teste" > arquivo.txt
```

Se já existirem dados, eles serão substituídos.

## `>>`

Adiciona no final:

```bash
echo "teste" >> arquivo.txt
```

O conteúdo anterior permanece.

Por exemplo:

```bash
echo "João" > lista.txt
echo "Maria" >> lista.txt
echo "Carlos" >> lista.txt
```

Resultado:

```text
João
Maria
Carlos
```

---

# 22. `> arquivo.txt` sozinho

Existe uma técnica útil:

```bash
> listaProjetos.txt
```

Isso esvazia o arquivo.

Se o arquivo não existir, ele será criado.

É equivalente à ideia de:

```bash
echo "" > listaProjetos.txt
```

mas é mais apropriado quando queremos simplesmente limpar o arquivo.

---

# 23. Um problema importante no seu script

Você tinha:

```bash
echo "$count, $projeto" >> listaProjetos.txt
```

Isso cria linhas assim:

```text
1, /home/joao/projetos/site
2, /home/joao/projetos/api
3, /home/joao/projetos/app
```

Observe que existe uma vírgula:

```text
1, /home/...
```

O `awk` normalmente considera espaços como separadores.

Portanto, para trabalhar corretamente com essa estrutura, podemos informar que o separador é `, `:

```bash
awk -F', ' '{print $1}' listaProjetos.txt
```

Primeira coluna:

```text
1
2
3
```

Segunda coluna:

```bash
awk -F', ' '{print $2}' listaProjetos.txt
```

Resultado:

```text
/home/joao/projetos/site
/home/joao/projetos/api
/home/joao/projetos/app
```

---

# 24. `-F` no `awk`

`-F` define o separador das colunas.

Por padrão, o `awk` considera espaços em branco como separadores.

Podemos mudar isso.

Exemplo:

```text
João;18;Alagoas
Maria;20;Bahia
```

Como o separador é `;`:

```bash
awk -F';' '{print $1}' arquivo.txt
```

Resultado:

```text
João
Maria
```

---

# 25. Juntando os conceitos

Agora podemos procurar o projeto escolhido.

Imagine:

```text
1, /home/joao/projetos/site
2, /home/joao/projetos/api
3, /home/joao/projetos/app
```

O usuário digita:

```text
2
```

Podemos usar:

```bash
projeto=$(awk -F', ' -v numero="$input" '$1 == numero {print $2}' listaProjetos.txt)
```

Isso parece complicado, mas podemos dividir.

## `-F', '`

Define:

```text
,
```

como separador.

---

## `-v numero="$input"`

Passa uma variável do Bash para o `awk`.

Se:

```bash
input=2
```

então o `awk` recebe:

```text
numero = 2
```

---

## `$1 == numero`

Compara a primeira coluna com o número escolhido.

Se temos:

```text
2, /home/joao/projetos/api
```

então:

```text
$1
```

é:

```text
2
```

e:

```text
numero
```

também é:

```text
2
```

Logo:

```text
$1 == numero
```

é verdadeiro.

---

## `{print $2}`

Quando a condição for verdadeira, imprime a segunda coluna:

```text
/home/joao/projetos/api
```

---

# 26. O `$(...)` finalmente guarda o resultado

Temos:

```bash
projeto=$(awk ...)
```

O `awk` produz:

```text
/home/joao/projetos/api
```

Então:

```bash
projeto
```

passa a conter:

```text
/home/joao/projetos/api
```

Podemos então fazer:

```bash
code "$projeto"
```

E o VS Code será aberto nesse projeto.

---

# 27. Modelo mental para entender seu programa

Seu programa pode ser pensado assim:

```text
$HOME/projetos
       │
       ▼
     for
       │
       ▼
listaProjetos.txt
       │
       ▼
 usuário digita um número
       │
       ▼
      awk
       │
       ▼
 encontra a linha correspondente
       │
       ▼
 pega a segunda coluna
       │
       ▼
    $projeto
       │
       ▼
   code "$projeto"
```

---

# 28. Regra principal para lembrar

Quando você escrever:

```bash
"alguma coisa"
```

isso normalmente é apenas **texto**.

Quando quiser executar um comando e usar o resultado:

```bash
$(alguma coisa)
```

Exemplo:

```bash
resultado=$(ls)
```

Não:

```bash
resultado="ls"
```

---

# 29. Regra para variáveis

Criando:

```bash
nome="João"
```

Usando:

```bash
echo "$nome"
```

Em condições:

```bash
if [ "$nome" = "João" ]; then
```

Em comandos:

```bash
echo "$nome"
```

---

# 30. Regra para o `awk`

Dentro do `awk`:

```bash
$1
```

primeira coluna.

```bash
$2
```

segunda coluna.

```bash
$3
```

terceira coluna.

Exemplo:

```bash
awk '{print $2}' arquivo.txt
```

---

# 31. Regra para o `sed`

Selecionar uma linha:

```bash
sed -n '5p' arquivo.txt
```

Selecionar uma linha usando variável:

```bash
linha=5
sed -n "${linha}p" arquivo.txt
```

---

# 32. Regra para `if`

Número:

```bash
if [ "$a" -eq "$b" ]; then
```

Texto:

```bash
if [ "$a" = "$b" ]; then
```

Não esqueça:

```text
$variavel
```

para acessar o valor da variável.

---

# 33. Exercício

Crie um arquivo:

```bash
nano pessoas.txt
```

Coloque:

```text
1, João
2, Maria
3, Carlos
4, Ana
```

Agora tente fazer:

### 1. Mostrar a primeira coluna

```bash
awk -F', ' '{print $1}' pessoas.txt
```

### 2. Mostrar a segunda coluna

```bash
awk -F', ' '{print $2}' pessoas.txt
```

### 3. Mostrar somente a linha 3

```bash
sed -n '3p' pessoas.txt
```

### 4. Guardar a linha 3 em uma variável

```bash
linha=$(sed -n '3p' pessoas.txt)
```

### 5. Mostrar a variável

```bash
echo "$linha"
```

### 6. Procurar a pessoa número 2

```bash
numero=2

awk -F', ' -v numero="$numero" '$1 == numero {print $2}' pessoas.txt
```

Resultado:

```text
Maria
```

Esses cinco conceitos — **variáveis, `$()`, `awk`, `sed` e condições** — são a base para entender a maior parte dos erros que apareceram no seu script.