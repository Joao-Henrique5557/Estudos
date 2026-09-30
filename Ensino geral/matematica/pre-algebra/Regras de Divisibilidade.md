# Regras de Divisibilidade

## 1. O que é divisibilidade?

Um número é **divisível** por outro quando a divisão entre eles é exata, ou seja, quando o **resto da divisão é igual a zero**.

### Exemplo

`24 ÷ 6 = 4`

Como o resto é `0`, podemos dizer que:

- 24 é divisível por 6.
- 6 é divisor de 24.
- 4 é o quociente.

---

# 2. Principais regras de divisibilidade

## Divisibilidade por 2

Um número é divisível por **2** quando seu último algarismo é **par**.

Os algarismos pares são:

`0, 2, 4, 6, 8`

### Exemplos

- `18` → termina em 8 → divisível por 2.
- `124` → termina em 4 → divisível por 2.
- `735` → termina em 5 → não é divisível por 2.

---

## Divisibilidade por 3

Um número é divisível por **3** quando a **soma de seus algarismos** é divisível por 3.

### Exemplo

`123`

Somamos:

`1 + 2 + 3 = 6`

Como `6` é divisível por 3, então:

`123` é divisível por 3.

### Outro exemplo

`472`

`4 + 7 + 2 = 13`

Como 13 não é divisível por 3:

`472` não é divisível por 3.

---

## Divisibilidade por 4

Um número é divisível por **4** quando os **dois últimos algarismos** formam um número divisível por 4.

### Exemplos

`316`

Os dois últimos algarismos são `16`.

Como:

`16 ÷ 4 = 4`

Então `316` é divisível por 4.

### Outro exemplo

`1250`

Os dois últimos algarismos são `50`.

Como 50 não é divisível por 4:

`1250` não é divisível por 4.

---

## Divisibilidade por 5

Um número é divisível por **5** quando termina em:

`0` ou `5`.

### Exemplos

- `25` → divisível por 5.
- `70` → divisível por 5.
- `145` → divisível por 5.
- `132` → não é divisível por 5.

---

## Divisibilidade por 6

Um número é divisível por **6** quando é divisível simultaneamente por **2 e por 3**.

### Exemplo

`132`

Primeiro:

- Termina em 2 → divisível por 2.
- `1 + 3 + 2 = 6` → divisível por 3.

Portanto:

`132` é divisível por 6.

---

## Divisibilidade por 7

Para verificar a divisibilidade por **7**:

1. Separe o último algarismo.
2. Multiplique esse algarismo por 2.
3. Subtraia o resultado do número formado pelos algarismos restantes.
4. Se o resultado for divisível por 7, o número original também será.

### Exemplo

`203`

Último algarismo:

`3`

Multiplicamos por 2:

`3 × 2 = 6`

Subtraímos:

`20 - 6 = 14`

Como `14` é divisível por 7:

`203` é divisível por 7.

---

## Divisibilidade por 8

Um número é divisível por **8** quando seus **três últimos algarismos** formam um número divisível por 8.

### Exemplo

`1.024`

Os três últimos algarismos são:

`024 = 24`

Como:

`24 ÷ 8 = 3`

Então `1.024` é divisível por 8.

---

## Divisibilidade por 9

Um número é divisível por **9** quando a soma de seus algarismos é divisível por 9.

### Exemplo

`729`

`7 + 2 + 9 = 18`

Como `18` é divisível por 9:

`729` é divisível por 9.

---

## Divisibilidade por 10

Um número é divisível por **10** quando termina em **0**.

### Exemplos

- `50` → divisível por 10.
- `120` → divisível por 10.
- `1.000` → divisível por 10.
- `125` → não é divisível por 10.

---

## Divisibilidade por 11

Um número é divisível por **11** quando a diferença entre a soma dos algarismos de posições alternadas é um múltiplo de 11, incluindo zero.

### Exemplo

`121`

Separando as posições:

`(1 + 1) - 2 = 0`

Como `0` é múltiplo de 11:

`121` é divisível por 11.

### Outro exemplo

`1.452`

`(1 + 5) - (4 + 2)`

`6 - 6 = 0`

Logo:

`1.452` é divisível por 11.

---

## Divisibilidade por 12

Um número é divisível por **12** quando é divisível simultaneamente por **3 e por 4**.

### Exemplo

`144`

Divisibilidade por 3:

`1 + 4 + 4 = 9`

9 é divisível por 3.

Divisibilidade por 4:

`44 ÷ 4 = 11`

Portanto:

`144` é divisível por 12.

---

## Divisibilidade por 15

Um número é divisível por **15** quando é divisível simultaneamente por **3 e por 5**.

### Exemplo

`135`

Por 3:

`1 + 3 + 5 = 9`

Por 5:

termina em `5`.

Logo:

`135` é divisível por 15.

---

## Divisibilidade por 25

Um número é divisível por **25** quando termina em:

- `00`
- `25`
- `50`
- `75`

### Exemplos

- `100` → divisível por 25.
- `125` → divisível por 25.
- `250` → divisível por 25.
- `375` → divisível por 25.
- `130` → não é divisível por 25.

---

## Divisibilidade por 100

Um número é divisível por **100** quando termina em:

`00`

### Exemplos

- `100`
- `500`
- `1.200`
- `10.000`

---

## Divisibilidade por 1

Todo número inteiro é divisível por **1**.

### Exemplos

`25 ÷ 1 = 25`

`784 ÷ 1 = 784`

---

# 3. Tabela-resumo

| Divisor | Regra                                                                     |
| ------- | ------------------------------------------------------------------------- |
| **1**   | Todo número inteiro é divisível por 1.                                    |
| **2**   | Último algarismo é 0, 2, 4, 6 ou 8.                                       |
| **3**   | Soma dos algarismos é divisível por 3.                                    |
| **4**   | Os dois últimos algarismos são divisíveis por 4.                          |
| **5**   | Termina em 0 ou 5.                                                        |
| **6**   | É divisível por 2 e por 3.                                                |
| **7**   | Dobro do último algarismo subtraído do restante resulta em múltiplo de 7. |
| **8**   | Os três últimos algarismos são divisíveis por 8.                          |
| **9**   | Soma dos algarismos é divisível por 9.                                    |
| **10**  | Termina em 0.                                                             |
| **11**  | Diferença entre as somas alternadas é múltiplo de 11.                     |
| **12**  | É divisível por 3 e por 4.                                                |
| **15**  | É divisível por 3 e por 5.                                                |
| **25**  | Termina em 00, 25, 50 ou 75.                                              |
| **100** | Termina em 00.                                                            |

---

# 4. Como usar as regras

As regras de divisibilidade permitem verificar se uma divisão será exata **sem precisar realizar a divisão completa**.

### Exemplo

Queremos descobrir se `3.456` é divisível por 6.

Para ser divisível por 6, ele precisa ser divisível por **2 e 3**.

### Por 2

O número termina em `6`.

Portanto, é divisível por 2.

### Por 3

Somamos os algarismos:

`3 + 4 + 5 + 6 = 18`

Como 18 é divisível por 3, o número também é divisível por 3.

### Conclusão

Como `3.456` é divisível por 2 e por 3:

**3.456 é divisível por 6.**

---

# 5. Divisibilidade e resto da divisão

A regra fundamental é:

> Um número `A` é divisível por `B` quando `A ÷ B` possui resto `0`.

Podemos representar isso matematicamente como:

```text
A mod B = 0
```

O operador `mod` representa o **resto da divisão**.

### Exemplo

```text
24 mod 6 = 0
```

Logo:

```text
24 é divisível por 6.
```

Já:

```text
25 mod 6 = 1
```

Logo:

```text
25 não é divisível por 6.
```

---

# 6. Divisores

Os **divisores** de um número são os números que conseguem dividi-lo exatamente, deixando resto zero.

### Exemplo

Os divisores de `12` são:

```text
1, 2, 3, 4, 6 e 12
```

Isso ocorre porque:

```text
12 ÷ 1 = 12
12 ÷ 2 = 6
12 ÷ 3 = 4
12 ÷ 4 = 3
12 ÷ 6 = 2
12 ÷ 12 = 1
```

---

# 7. Múltiplos

Um número é **múltiplo** de outro quando pode ser obtido multiplicando esse número por um inteiro.

### Exemplo

Múltiplos de 5:

```text
5, 10, 15, 20, 25, 30, 35, ...
```

Podemos escrever:

```text
5 × 1 = 5
5 × 2 = 10
5 × 3 = 15
5 × 4 = 20
```

Portanto, 20 é múltiplo de 5 e 5 é divisor de 20.

---

# 8. Resumo para estudo

As regras mais importantes para memorizar são:

```text
2  → termina em número par
3  → soma dos algarismos
4  → últimos 2 algarismos
5  → termina em 0 ou 5
6  → divisível por 2 e 3
8  → últimos 3 algarismos
9  → soma dos algarismos
10 → termina em 0
11 → soma alternada dos algarismos
12 → divisível por 3 e 4
25 → termina em 00, 25, 50 ou 75
100 → termina em 00
```

## Conceito principal

**Divisibilidade = divisão com resto igual a zero.**
