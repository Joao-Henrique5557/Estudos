# Docker — Parte 1: Referência de Comandos

> **Objetivo:** servir como material de referência para os fundamentos do Docker, incluindo imagens, contêineres, execução, gerenciamento, Dockerfiles e transferência de arquivos entre host e contêiner.

---

# 1. Docker

O **Docker** é uma plataforma utilizada para empacotar e executar aplicações em **contêineres**.

Um contêiner reúne a aplicação e suas dependências em um ambiente isolado e reproduzível.

Verifique se o Docker está instalado:

```bash
docker --version
```

---

# 2. Imagem e Contêiner

Dois conceitos fundamentais:

### Imagem

Uma **imagem Docker** é um modelo somente leitura utilizado para criar contêineres.

Ela pode conter:

- sistema de arquivos;
- dependências;
- arquivos da aplicação;
- configurações;
- instruções de execução.

### Contêiner

Um **contêiner** é uma instância criada a partir de uma imagem.

```text
Imagem
   │
   ├──> Contêiner
   ├──> Contêiner
   └──> Contêiner
```

Uma mesma imagem pode originar vários contêineres.

---

# 3. `docker --version`

Exibe a versão instalada do Docker.

```bash
docker --version
```

---

# Imagens

## 4. `docker pull`

Baixa uma imagem de um **registry**.

```bash
docker pull alpine
```

Para baixar uma versão específica:

```bash
docker pull alpine:3.20
```

Estrutura:

```bash
docker pull IMAGE:TAG
```

Se nenhuma tag for especificada, o Docker utiliza `latest` como padrão, quando essa tag estiver disponível.

---

## 5. `docker images`

Lista as imagens armazenadas localmente.

```bash
docker images
```

Principais colunas:

| Coluna       | Significado             |
| ------------ | ----------------------- |
| `REPOSITORY` | Nome do repositório     |
| `TAG`        | Tag/versão              |
| `IMAGE ID`   | Identificador da imagem |
| `CREATED`    | Data de criação         |
| `SIZE`       | Tamanho                 |

Filtrar por repositório:

```bash
docker images alpine
```

---

## 6. `docker tag`

Cria um nome/tag adicional para uma imagem existente.

```bash
docker tag SOURCE:TAG TARGET:TAG
```

Exemplo:

```bash
docker tag alpine:latest my-alpine:v1
```

Isso não cria uma cópia independente da imagem.

Os dois nomes apontam para a mesma imagem subjacente.

---

# Execução de Contêineres

## 7. `docker run`

Cria e executa um contêiner a partir de uma imagem.

```bash
docker run hello-world
```

Estrutura:

```bash
docker run IMAGE
```

---

## 8. Executar um comando específico

É possível passar um comando depois do nome da imagem:

```bash
docker run IMAGE COMMAND [ARGUMENTS]
```

Exemplo:

```bash
docker run alpine echo "hello from a container"
```

Nesse caso, o Docker:

1. cria o contêiner;
2. executa `echo`;
3. exibe o resultado;
4. termina o processo.

---

## 9. `--name`

Define um nome personalizado para o contêiner.

```bash
docker run --name greeter alpine echo hi
```

O nome pode ser utilizado posteriormente:

```bash
docker inspect --format "{{.Name}}" greeter
```

Isso facilita a identificação e o gerenciamento dos contêineres.

---

## 10. `-d`

A opção `-d` significa **detached**.

Executa o contêiner em segundo plano.

```bash
docker run -d --name web nginx
```

O terminal fica disponível enquanto o contêiner continua executando.

---

## 11. `--rm`

Remove automaticamente o contêiner quando ele termina.

```bash
docker run --rm alpine echo "clean up after me"
```

É especialmente útil para contêineres temporários.

---

## 12. Estrutura de `docker run`

As flags ficam entre `run` e o nome da imagem:

```bash
docker run [FLAGS] IMAGE COMMAND
```

Exemplo:

```bash
docker run --rm -d --name web nginx
```

---

# Sistema de Arquivos da Imagem

## 13. Cada imagem possui seu próprio sistema de arquivos

Imagens diferentes podem possuir ambientes diferentes.

```bash
docker run alpine cat /etc/os-release
```

Já:

```bash
docker run ubuntu cat /etc/os-release
```

produz informações diferentes.

O arquivo:

```text
/etc/os-release
```

contém informações sobre a distribuição Linux utilizada pela imagem.

---

# Shell em Contêineres

## 14. `sh -c`

Permite executar uma string como um comando de shell.

```bash
docker run alpine sh -c "echo abc | tr a-z A-Z"
```

Resultado:

```text
ABC
```

Isso permite utilizar recursos como:

- pipes (`|`);
- variáveis;
- redirecionamentos;
- múltiplos comandos;
- ferramentas de CLI.

---

# Gerenciamento de Contêineres

## 15. `docker ps`

Lista os contêineres em execução.

```bash
docker ps
```

---

## 16. `docker ps -a`

Lista todos os contêineres, incluindo os parados.

```bash
docker ps -a
```

A coluna `STATUS` mostra o estado.

Exemplo:

```text
Up 10 minutes
```

Contêiner em execução.

```text
Exited (0) 2 minutes ago
```

Contêiner encerrado.

---

## 17. `docker stop`

Para um contêiner em execução.

```bash
docker stop web
```

Depois disso, o contêiner passa para o estado `Exited`, mas continua existindo.

---

## 18. `docker rm`

Remove um contêiner parado.

```bash
docker rm web
```

---

## 19. `docker rm -f`

Força a remoção de um contêiner, inclusive se estiver em execução.

```bash
docker rm -f web
```

> **Atenção:** utilize `-f` com cuidado, principalmente em contêineres importantes.

---

# Comandos Dentro de Contêineres

## 20. `docker exec`

Executa um comando dentro de um contêiner que já esteja em execução.

Exemplo:

```bash
docker run -d --name live nginx
```

Depois:

```bash
docker exec live echo "hello from inside"
```

O comando é executado dentro do contêiner.

> `docker exec` exige que o contêiner esteja em execução.

---

# Logs

## 21. `docker logs`

Exibe a saída capturada de um contêiner.

```bash
docker logs web
```

Os logs podem ser consultados mesmo depois que o contêiner terminou.

Exemplo:

```bash
docker run --name once alpine echo line-one
```

Depois:

```bash
docker logs once
```

Resultado:

```text
line-one
```

---

# Inspeção

## 22. `docker inspect`

Exibe informações detalhadas de um objeto Docker em formato JSON.

```bash
docker inspect web
```

Pode mostrar informações como:

- estado;
- imagem;
- rede;
- IP;
- volumes;
- portas;
- configurações;
- IDs.

---

## 23. `docker inspect --format`

Permite extrair uma informação específica usando um **Go template**.

```bash
docker inspect --format "{{.State.Status}}" web
```

Pode retornar:

```text
running
```

Outro exemplo:

```bash
docker inspect --format "{{.Config.Image}}" web
```

Pode retornar:

```text
nginx
```

### Placeholders úteis

```text
{{.State.Status}}
```

Status do contêiner.

```text
{{.Config.Image}}
```

Imagem utilizada.

```text
{{.Name}}
```

Nome do contêiner.

---

# Dockerfile

## 24. O que é um Dockerfile?

Um **Dockerfile** é um arquivo de texto contendo instruções utilizadas para construir uma imagem Docker.

Exemplo:

```dockerfile
FROM alpine
```

---

## 25. `FROM`

Define a imagem base utilizada pelo Dockerfile.

```dockerfile
FROM alpine
```

Também pode especificar uma versão:

```dockerfile
FROM alpine:3.20
```

Estrutura:

```dockerfile
FROM IMAGE:TAG
```

---

## 26. Criar um Dockerfile pelo terminal

É possível utilizar um **heredoc**:

```bash
cat > Dockerfile <<'EOF'
FROM alpine
EOF
```

Depois:

```bash
cat Dockerfile
```

Resultado:

```dockerfile
FROM alpine
```

---

# Construção de Imagens

## 27. `docker build`

Constrói uma imagem a partir de um Dockerfile.

```bash
docker build -t myimage .
```

A opção `-t` define o nome/tag da imagem.

O `.` define o **contexto de build**, neste caso, o diretório atual.

Estrutura:

```bash
docker build -t IMAGE:TAG CONTEXT
```

Exemplo:

```bash
docker build -t myimage:v1 .
```

Depois de um build bem-sucedido:

```bash
docker images
```

A nova imagem deverá aparecer na lista.

---

# Instrução `COPY`

## 28. `COPY`

Copia arquivos do **contexto de build** para dentro da imagem.

Exemplo:

```dockerfile
FROM alpine
COPY message.txt /message.txt
```

Se existir:

```text
message.txt
```

no diretório do contexto de build, ele será incorporado à imagem.

### Construir

```bash
docker build -t hasfile .
```

### Executar

```bash
docker run hasfile cat /message.txt
```

O arquivo estará disponível dentro do contêiner.

---

# Instrução `WORKDIR`

## 29. `WORKDIR`

Define o diretório de trabalho para as instruções seguintes do Dockerfile.

Pode ser entendido de forma semelhante a utilizar `cd`.

Exemplo:

```dockerfile
FROM alpine

WORKDIR /app

COPY data.txt data.txt
```

Nesse caso:

```text
/app/data.txt
```

será o caminho final do arquivo.

O caminho relativo utilizado por `COPY` é resolvido a partir do `WORKDIR`.

---

# Instrução `CMD`

## 30. `CMD`

Define o comando padrão executado quando um contêiner é iniciado sem outro comando especificado.

Exemplo:

```dockerfile
FROM alpine

CMD ["echo", "container ran"]
```

Construindo a imagem:

```bash
docker build -t greeter .
```

Executando:

```bash
docker run greeter
```

Resultado:

```text
container ran
```

---

## 31. Sobrescrevendo `CMD`

Um comando passado ao `docker run` substitui o `CMD` padrão.

Se o Dockerfile possui:

```dockerfile
FROM alpine

CMD ["echo", "container ran"]
```

Execute:

```bash
docker run greeter
```

Resultado:

```text
container ran
```

Mas:

```bash
docker run greeter echo "outro comando"
```

executará:

```text
outro comando
```

O `CMD` original não será executado nesse caso.

---

# Transferência de Arquivos

## 32. `docker cp`

O comando `docker cp` copia arquivos ou diretórios entre o **host** e um **contêiner**.

A ordem dos caminhos determina a direção da cópia.

---

## 33. Copiar do contêiner para o host

A origem é o contêiner e o destino é o host.

```bash
docker cp mybox:/note.txt ./back.txt
```

Estrutura:

```bash
docker cp CONTAINER:SOURCE HOST_DESTINATION
```

Nesse exemplo:

```text
Contêiner:
    /note.txt
       │
       ▼
Host:
    ./back.txt
```

---

## 34. Copiar do host para o contêiner

A origem é o host e o destino é o contêiner.

```bash
docker cp ./back.txt mybox:/note.txt
```

Estrutura:

```bash
docker cp HOST_SOURCE CONTAINER:DESTINATION
```

---

## 35. Copiar um arquivo para um contêiner

Exemplo:

```bash
docker cp note.txt mybox:/note.txt
```

Depois, é possível verificar o arquivo usando `docker exec`:

```bash
docker exec mybox cat /note.txt
```

---

## 36. Regra para memorizar `docker cp`

```text
HOST → CONTÊINER

docker cp arquivo.txt container:/arquivo.txt
```

```text
CONTÊINER → HOST

docker cp container:/arquivo.txt ./arquivo.txt
```

A regra é:

```text
SOURCE → DESTINATION
```

A origem sempre aparece primeiro.

---

# Exemplo Completo com Dockerfile

## 37. Criando uma imagem com arquivo e comando padrão

Crie um arquivo:

```bash
echo "Olá do Docker!" > message.txt
```

Crie o Dockerfile:

```bash
cat > Dockerfile <<'EOF'
FROM alpine

WORKDIR /app

COPY message.txt message.txt

CMD ["cat", "message.txt"]
EOF
```

Construa a imagem:

```bash
docker build -t message-app .
```

Execute:

```bash
docker run --rm message-app
```

Resultado esperado:

```text
Olá do Docker!
```

Nesse exemplo:

```text
Dockerfile
    │
    ├── FROM alpine
    │
    ├── WORKDIR /app
    │
    ├── COPY message.txt message.txt
    │
    └── CMD ["cat", "message.txt"]
             │
             ▼
          IMAGEM
             │
             ▼
        CONTÊINER
```

---

# Fluxo Fundamental do Docker

```text
                 REGISTRY
                     │
                docker pull
                     │
                     ▼
                  IMAGEM
                     │
                 docker run
                     │
                     ▼
                CONTÊINER
                  │     │
          docker exec  docker logs
                  │     │
                  └──┬──┘
                     │
               docker inspect
                     │
                 docker stop
                     │
                     ▼
                  Exited
                     │
                  docker rm
                     │
                     ▼
                 REMOVIDO
```

Para construir sua própria imagem:

```text
Dockerfile + Contexto
         │
         │ docker build
         ▼
       IMAGEM
         │
         │ docker run
         ▼
     CONTÊINER
```

Para transferir arquivos:

```text
Host ──docker cp──> Contêiner
Host <─docker cp── Contêiner
```

---

# Referência Rápida

| Comando/Instrução         | Função                                |
| ------------------------- | ------------------------------------- |
| `docker --version`        | Mostra a versão do Docker             |
| `docker pull`             | Baixa uma imagem                      |
| `docker images`           | Lista imagens locais                  |
| `docker tag`              | Cria uma tag adicional                |
| `docker run`              | Cria e executa um contêiner           |
| `docker ps`               | Lista contêineres em execução         |
| `docker ps -a`            | Lista todos os contêineres            |
| `docker stop`             | Para um contêiner                     |
| `docker rm`               | Remove um contêiner                   |
| `docker rm -f`            | Força a remoção                       |
| `docker exec`             | Executa comando em contêiner ativo    |
| `docker logs`             | Exibe logs                            |
| `docker inspect`          | Exibe detalhes                        |
| `docker inspect --format` | Extrai informações específicas        |
| `docker cp`               | Copia arquivos entre host e contêiner |
| `docker build`            | Constrói uma imagem                   |
| `Dockerfile`              | Arquivo de instruções para construção |
| `FROM`                    | Define a imagem base                  |
| `WORKDIR`                 | Define o diretório de trabalho        |
| `COPY`                    | Copia arquivos para a imagem          |
| `CMD`                     | Define o comando padrão do contêiner  |

---

# Flags e Opções Fundamentais

| Opção      | Significado              | Exemplo                                           |
| ---------- | ------------------------ | ------------------------------------------------- |
| `-d`       | Detached / segundo plano | `docker run -d nginx`                             |
| `--name`   | Define nome do contêiner | `docker run --name web nginx`                     |
| `--rm`     | Remove ao terminar       | `docker run --rm alpine`                          |
| `-f`       | Força a operação         | `docker rm -f web`                                |
| `-t`       | Define nome/tag no build | `docker build -t app .`                           |
| `--format` | Formata a saída          | `docker inspect --format "{{.State.Status}}" web` |

---

# Conceitos Essenciais da Parte 1

Antes de avançar para Docker Compose, volumes, redes e Docker em aplicações reais, domine:

1. **Docker**
2. **Imagem**
3. **Contêiner**
4. `docker --version`
5. `docker pull`
6. `docker images`
7. `docker tag`
8. `docker run`
9. `docker ps`
10. `docker ps -a`
11. `--name`
12. `-d`
13. `--rm`
14. `docker stop`
15. `docker rm`
16. `docker exec`
17. `docker logs`
18. `docker inspect`
19. `docker inspect --format`
20. `docker cp`
21. `Dockerfile`
22. `FROM`
23. `docker build`
24. `COPY`
25. `WORKDIR`
26. `CMD`
27. Contexto de build
28. Host → contêiner
29. Contêiner → host

---

# Ordem Recomendada de Estudo

```text
1. Docker
   │
   ├── Imagens
   │     ├── docker pull
   │     ├── docker images
   │     └── docker tag
   │
   ├── Contêineres
   │     ├── docker run
   │     ├── docker ps
   │     ├── docker stop
   │     └── docker rm
   │
   ├── Operações
   │     ├── docker exec
   │     ├── docker logs
   │     └── docker inspect
   │
   ├── Arquivos
   │     └── docker cp
   │
   └── Dockerfile
         ├── FROM
         ├── WORKDIR
         ├── COPY
         ├── CMD
         └── docker build
```

> **Regra prática:** primeiro compreenda a diferença entre **imagem**, **contêiner** e **host**. Depois aprenda a executar e gerenciar contêineres. Em seguida, aprenda `docker cp` para transferência de arquivos e avance para **Dockerfile → `docker build` → `FROM` → `WORKDIR` → `COPY` → `CMD`**. Esses conceitos formam a base para estudar posteriormente **volumes, redes, Docker Compose, registries e deploys**.
