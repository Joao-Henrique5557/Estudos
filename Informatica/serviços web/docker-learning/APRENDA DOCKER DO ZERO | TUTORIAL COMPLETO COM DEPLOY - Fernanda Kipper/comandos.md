# Comandos Utilizados no Tutorial Docker

## Comandos Básicos de Containers

### Listar containers em execução

```bash
docker ps
```

Lista apenas os containers que estão em execução.

### Listar todos os containers

```bash
docker ps -a
```

Lista todos os containers, incluindo os que já foram finalizados.

### Iniciar um container

```bash
docker run <imagem>
```

Cria e inicia um container a partir de uma imagem.

### Iniciar um container em modo interativo

```bash
docker run -it <imagem> bash
```

Inicia um container e abre um terminal Bash dentro dele.

### Parar um container

```bash
docker stop <container>
```

Interrompe a execução de um container.

### Iniciar um container parado

```bash
docker start <container>
```

Reinicia um container que estava parado.

### Executar um comando em um container em execução

```bash
docker exec -it <container> bash
```

Abre um terminal Bash dentro de um container que já está em execução.

---

## Gerenciamento de Imagens

### Criar uma imagem a partir de um Dockerfile

```bash
docker build -t <nome-da-imagem>:<tag> .
```

Cria uma imagem utilizando o Dockerfile presente no diretório atual.

### Criar uma imagem para uma arquitetura específica

```bash
docker build --platform linux/amd64 -t <nome-da-imagem>:<tag> .
```

Cria uma imagem direcionada para uma arquitetura específica, como `amd64`.

### Criar uma nova tag para uma imagem

```bash
docker tag <imagem-origem>:<tag> <usuario>/<imagem>:<tag>
```

Adiciona uma nova tag a uma imagem existente.

### Fazer login no Docker Hub

```bash
docker login -u <usuario>
```

Realiza a autenticação na conta do Docker Hub.

### Enviar uma imagem para o Docker Hub

```bash
docker push <usuario>/<imagem>:<tag>
```

Publica uma imagem local em um repositório remoto.

---

## Mapeamento de Portas

### Mapear portas automaticamente

```bash
docker run -P <imagem>
```

Mapeia automaticamente as portas expostas pelo container para portas aleatórias do host.

### Mapear uma porta específica

```bash
docker run -p <porta_host>:<porta_container> <imagem>
```

Mapeia uma porta específica do computador para uma porta do container.

---

## Comandos de Infraestrutura (Ubuntu/VPS)

### Conectar-se a uma VPS via SSH

```bash
ssh root@<ip-do-servidor>
```

Estabelece uma conexão remota com um servidor.

### Atualizar os pacotes do sistema

```bash
sudo apt update && sudo apt upgrade
```

Atualiza a lista de pacotes e instala as versões mais recentes disponíveis.

### Instalar o Docker

```bash
sudo apt install docker-ce
```

Instala o Docker Community Edition no Ubuntu.

### Verificar a versão do Docker

```bash
docker --version
```

Exibe a versão do Docker instalada.
