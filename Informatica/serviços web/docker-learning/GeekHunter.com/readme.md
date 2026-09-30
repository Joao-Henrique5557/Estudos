# O que é Docker

Em termos simples, o Docker é uma **plataforma de software** que simplifica o processo de **construção, execução, gerenciamento e distribuição de aplicativos**.

Ele faz isso **virtualizando o sistema operacional do computador** no qual está instalado e sendo executado.

Ele permite que os usuários criem ambientes independentes e isolados para iniciar e implantar seus aplicativos. Esses ambientes são chamados de **contêineres**.

Isso permitirá que o desenvolvedor execute um contêiner em qualquer máquina.

Com o Docker, **não há mais problemas de dependência ou compilação**. Tudo o que você precisa fazer é iniciar seu contêiner e seu aplicativo será iniciado imediatamente.

O Docker é um programa **open source** desenvolvido pela Docker Inc. com a linguagem de programação **Go**.

Sua primeira edição foi lançada em **13 de março de 2013** e, desde seu lançamento, tornou-se um software importantíssimo no mundo do desenvolvimento de tecnologia.

Podemos dizer que as palavras-chave para o Docker são: **construir, entregar e rodar em qualquer ambiente** (_build, ship and run anywhere_).

## Arquitetura do Docker

Os principais componentes da arquitetura envolvem:

- **Docker** para Mac, Linux e Windows – versões que permitem instalar e executar containers nos sistemas operacionais de forma isolada.
- **Docker Daemon** – Software que roda na máquina onde o Docker está instalado. O usuário não interage diretamente com o daemon.
- **Docker Client** – CLI ou REST API que aceita comandos do usuário e repassa estes comandos ao Docker daemon.
- **Docker Image** – É um template. Uma imagem contém todos os dados e metadados necessários para executar containers a partir de uma imagem.
- **Docker Container** – Detém tudo que é necessário para uma aplicação ser executada. Cada container é criado a partir de uma imagem. Cada container é uma aplicação isolada independente.
- **Docker Engine** – Usado para criar imagens e containers.
- **Docker Registry** – Uma coleção de imagens hospedadas e rotuladas que juntas permitem a criação do sistema de arquivos de um container. Um registro pode ser público ou privado.
- **Docker Hub** – Este é um registro usado para hospedar e baixar diversas imagens. Pode ser visto como uma plataforma SaaS de compartilhamento e gerenciamento de imagens.
- **Dockerfile** – Um arquivo texto contendo uma sintaxe simples para criação de novas imagens.
- **Docker Compose** – Usado para definir aplicações usando diversos containers.
- **Docker Swarm** – É uma ferramenta que permite o agrupamento (_clustering_) de Containers Docker.
