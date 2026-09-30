# Cálculo de Sub-redes

## 1. Introdução

O cálculo de sub-redes, também chamado de **subnetting**, é uma técnica utilizada para dividir uma rede IP em redes menores. Essa divisão permite organizar melhor os dispositivos, controlar o tráfego e utilizar os endereços IP de maneira mais eficiente.

O subnetting é realizado principalmente utilizando o endereço **IPv4** e sua máscara de sub-rede.

## 2. Endereço IPv4

Um endereço IPv4 possui **32 bits**, divididos em quatro grupos de 8 bits chamados octetos.

Exemplo:

```text
192.168.1.10
```

Em binário:

```text
11000000.10101000.00000001.00001010
```

Cada octeto pode representar valores de **0 a 255**.

## 3. Máscara de sub-rede

A máscara determina qual parte do endereço representa a **rede** e qual parte representa os **hosts**.

Exemplo:

```text
255.255.255.0
```

Também pode ser representada utilizando a notação CIDR:

```text
/24
```

O `/24` significa que os primeiros 24 bits pertencem à rede e os 8 bits restantes são destinados aos hosts.

## 4. Dividindo uma rede

Uma rede pode ser dividida utilizando bits que originalmente pertenciam à parte dos hosts.

Por exemplo:

```text
192.168.1.0/24
```

Possui 8 bits disponíveis para hosts.

Se utilizarmos 2 desses bits para criar sub-redes:

```text
/24 → /26
```

Teremos:

```text
2² = 4 sub-redes
```

Cada sub-rede terá:

```text
2⁶ = 64 endereços
```

Porém, normalmente dois endereços são reservados:

- **Endereço de rede**
- **Endereço de broadcast**

Portanto:

```text
64 - 2 = 62 hosts utilizáveis
```

## 5. Fórmulas importantes

### Quantidade de sub-redes

Quando `n` bits são emprestados da parte dos hosts:

```text
Sub-redes = 2ⁿ
```

### Quantidade de hosts

Se restarem `h` bits para hosts:

```text
Hosts = 2ʰ - 2
```

O `-2` corresponde ao endereço de rede e ao endereço de broadcast.

## 6. Exemplo

Considere:

```text
192.168.1.0/26
```

A máscara correspondente é:

```text
255.255.255.192
```

O último octeto possui blocos de 64 endereços.

As sub-redes serão:

```text
192.168.1.0/26
192.168.1.64/26
192.168.1.128/26
192.168.1.192/26
```

### Primeira sub-rede

```text
Rede:       192.168.1.0
Hosts:      192.168.1.1 – 192.168.1.62
Broadcast:  192.168.1.63
```

### Segunda sub-rede

```text
Rede:       192.168.1.64
Hosts:      192.168.1.65 – 192.168.1.126
Broadcast:  192.168.1.127
```

### Terceira sub-rede

```text
Rede:       192.168.1.128
Hosts:      192.168.1.129 – 192.168.1.190
Broadcast:  192.168.1.191
```

### Quarta sub-rede

```text
Rede:       192.168.1.192
Hosts:      192.168.1.193 – 192.168.1.254
Broadcast:  192.168.1.255
```

## 7. Conceitos principais

| Conceito         | Função                                     |
| ---------------- | ------------------------------------------ |
| IP               | Identifica um dispositivo na rede          |
| Máscara          | Define a divisão entre rede e host         |
| Sub-rede         | Uma divisão menor de uma rede              |
| Endereço de rede | Identifica a própria sub-rede              |
| Broadcast        | Comunicação com todos os hosts da sub-rede |
| Host             | Dispositivo conectado à rede               |
| CIDR             | Representação da máscara usando `/n`       |

## 8. Resumo

O subnetting permite dividir uma rede grande em várias redes menores.

Para calcular uma sub-rede, é necessário identificar:

1. O endereço IP;
2. A máscara original;
3. Quantos bits serão utilizados para criar sub-redes;
4. A quantidade de sub-redes;
5. A quantidade de hosts por sub-rede;
6. O endereço de rede;
7. O intervalo de hosts;
8. O endereço de broadcast.

As principais fórmulas são:

```text
Sub-redes = 2ⁿ
Hosts utilizáveis = 2ʰ - 2
```

onde:

- `n` = quantidade de bits utilizados para sub-redes;
- `h` = quantidade de bits restantes para hosts.
