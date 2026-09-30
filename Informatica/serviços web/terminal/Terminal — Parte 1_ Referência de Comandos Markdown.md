# Terminal — Parte 1: Referência de Comandos

> **Objetivo:** servir como material de referência rápida para os principais comandos de terminal relacionados à navegação e manipulação do sistema de arquivos.

---

## 1. Terminal

O **terminal** é uma interface baseada em texto utilizada para se comunicar com o sistema operacional por meio de comandos.

Exemplo:

```bash
echo "Hello World!"
```

### Estrutura básica de um comando

```bash
command "argument"
```

- `command` — programa ou comando que será executado.
- `argument` — informação passada para o comando.
- O terminal diferencia letras maiúsculas de minúsculas (**case sensitive**).

---

## 2. `echo`

Exibe texto no terminal.

```bash
echo "Hello World!"
```

Também pode ser utilizado para exibir o conteúdo de variáveis:

```bash
echo $HOME
```

---

## 3. Comentários em Shell

Comentários começam com `#` e são ignorados pelo shell.

```bash
# Este é um comentário
echo "Hello!" # Comentário na mesma linha
```

### Shebang

O **shebang** especifica o interpretador que deve executar um script.

```bash
#!/bin/bash
```

Exemplo:

```bash
#!/bin/bash

echo "Olá, mundo!"
```

---

# Navegação no Sistema de Arquivos

## 4. `pwd`

`pwd` significa **Print Working Directory**.

Mostra o caminho completo do diretório atual.

```bash
pwd
```

Exemplo de saída:

```text
/home/usuario
```

---

## 5. `ls`

Lista arquivos e diretórios.

```bash
ls
```

### Opções comuns

```bash
ls -l
```

Exibe informações detalhadas.

```bash
ls -a
```

Exibe também arquivos ocultos.

```bash
ls -la
```

Combina as duas opções.

Para listar o conteúdo de um diretório específico:

```bash
ls documents
```

---

## 6. `cd`

`cd` significa **Change Directory**.

É utilizado para navegar entre diretórios.

```bash
cd documents
```

### Atalhos importantes

```bash
cd ..
```

Volta para o diretório pai.

```bash
cd ~
```

Vai para o diretório home do usuário.

```bash
cd /
```

Vai para o diretório raiz.

```bash
cd -
```

Retorna ao diretório anterior.

```bash
cd
```

Também retorna ao diretório home.

---

# Caminhos

## 7. Diretório raiz `/`

O `/` representa o **diretório raiz** do sistema de arquivos.

```bash
cd /
```

É o ponto mais alto da hierarquia de diretórios.

---

## 8. Diretório Home `~`

O `~` representa o diretório pessoal do usuário.

Normalmente:

```text
/home/username
```

Exemplo:

```bash
cd ~
```

Também é possível verificar o caminho:

```bash
echo ~
```

### Diferença

| Símbolo | Significado            |
| ------- | ---------------------- |
| `/`     | Raiz de todo o sistema |
| `~`     | Home do usuário atual  |

---

## 9. Caminho Absoluto

Um caminho absoluto começa na raiz `/`.

Exemplo:

```bash
cd /home/usuario/documents
```

Ele aponta para o mesmo local independentemente do diretório atual.

---

## 10. Caminho Relativo

Um caminho relativo começa a partir do diretório atual.

```bash
cd documents
```

### Símbolos importantes

`.` representa o diretório atual:

```bash
cd ./documents
```

É equivalente a:

```bash
cd documents
```

`..` representa o diretório pai:

```bash
cd ..
```

---

# Criação de Arquivos e Diretórios

## 11. `touch`

Cria um arquivo vazio.

```bash
touch hello.txt
```

### Criar vários arquivos

```bash
touch file1.txt file2.txt file3.txt
```

### Criar arquivo dentro de um diretório

```bash
touch documents/notes.txt
```

Se o arquivo já existir, `touch` não apaga seu conteúdo; ele atualiza seus timestamps.

---

## 12. `mkdir`

`mkdir` significa **Make Directory**.

Cria um novo diretório.

```bash
mkdir projects
```

### Criar vários diretórios

```bash
mkdir projects documents backups
```

### Criar diretórios aninhados

Utilize `-p`:

```bash
mkdir -p projects/app/src
```

A opção `-p` cria automaticamente os diretórios-pai que ainda não existem.

### Convenções de nomenclatura

Prefira:

```bash
mkdir my-project
```

ou:

```bash
mkdir my_project
```

Evite espaços:

```bash
mkdir my project
```

Nesse caso, o shell interpreta `my` e `project` como argumentos separados.

---

# Visualização de Arquivos

## 13. `cat`

Exibe o conteúdo de um arquivo.

```bash
cat filename.txt
```

É útil para arquivos pequenos.

---

## 14. `head`

Exibe o início de um arquivo.

Por padrão, mostra as primeiras 10 linhas:

```bash
head filename.txt
```

Para definir a quantidade de linhas:

```bash
head -n 5 filename.txt
```

---

## 15. `tail`

Exibe o final de um arquivo.

Por padrão, mostra as últimas 10 linhas:

```bash
tail filename.txt
```

Para definir a quantidade:

```bash
tail -n 3 filename.txt
```

---

## 16. `less`

Abre um arquivo em um visualizador que permite navegar pelo conteúdo.

```bash
less filename.txt
```

Para sair:

```text
q
```

---

# Cópia, Movimentação e Renomeação

## 17. `cp`

`cp` significa **copy**.

Copia arquivos ou diretórios.

### Copiar um arquivo

```bash
cp readme.txt backup.txt
```

### Copiar um arquivo para um diretório

```bash
cp readme.txt documents/
```

### Copiar um diretório

Utilize `-r` (**recursive**):

```bash
cp -r documents backup_documents
```

### Copiar com confirmação

```bash
cp -i readme.txt backup.txt
```

A opção `-i` solicita confirmação antes de sobrescrever um arquivo existente.

---

## 18. `mv`

`mv` significa **move**.

É utilizado para **mover ou renomear** arquivos e diretórios.

### Renomear um arquivo

```bash
mv readme.txt info.txt
```

### Mover um arquivo

```bash
mv readme.txt documents/
```

### Mover e renomear simultaneamente

```bash
mv readme.txt documents/info.txt
```

### Renomear um diretório

```bash
mv documents files
```

### Mover um diretório

```bash
mv documents projects/
```

### Mover e renomear um diretório

```bash
mv documents projects/files
```

### Solicitar confirmação

```bash
mv -i readme.txt documents/
```

Diferentemente de `cp`, `mv` não mantém uma cópia original: o arquivo ou diretório é movido.

---

# Exclusão

## 19. `rm`

`rm` significa **remove**.

Exclui arquivos.

```bash
rm readme.txt
```

### Excluir vários arquivos

```bash
rm file1.txt file2.txt file3.txt
```

### Solicitar confirmação

```bash
rm -i readme.txt
```

### Forçar exclusão

```bash
rm -f readme.txt
```

A opção `-f` (**force**) força a exclusão sem solicitar confirmação.

> **Atenção:** `rm` normalmente remove arquivos sem enviá-los para a lixeira.

---

## 20. `rm -r`

A opção `-r` significa **recursive**.

É utilizada para excluir diretórios e todo o seu conteúdo.

```bash
rm -r documents
```

---

## 21. `rm -rf`

Combina:

- `-r` → recursivo
- `-f` → força

```bash
rm -rf documents
```

Isso remove o diretório e todo o seu conteúdo sem solicitar confirmação.

> **PERIGO:** `rm -rf` pode apagar uma grande quantidade de arquivos de forma irreversível. Verifique cuidadosamente o caminho antes de executá-lo.

---

## 22. `rmdir`

Remove um diretório **vazio**.

```bash
rmdir empty_folder
```

Se o diretório possuir arquivos ou outros diretórios dentro dele, `rmdir` não conseguirá removê-lo.

Para um diretório com conteúdo:

```bash
rm -r documents
```

---

# Referência Rápida

| Comando | Função                        |
| ------- | ----------------------------- |
| `pwd`   | Mostra o diretório atual      |
| `ls`    | Lista arquivos e diretórios   |
| `cd`    | Navega entre diretórios       |
| `echo`  | Exibe texto                   |
| `touch` | Cria arquivo vazio            |
| `mkdir` | Cria diretório                |
| `cat`   | Exibe conteúdo de arquivo     |
| `head`  | Exibe o início de um arquivo  |
| `tail`  | Exibe o final de um arquivo   |
| `less`  | Visualiza arquivo com rolagem |
| `cp`    | Copia arquivos/diretórios     |
| `mv`    | Move ou renomeia              |
| `rm`    | Remove arquivos               |
| `rmdir` | Remove diretórios vazios      |

---

# Flags Fundamentais

| Flag | Significado                                   | Exemplo              |
| ---- | --------------------------------------------- | -------------------- |
| `-r` | Recursivo                                     | `cp -r dir backup`   |
| `-f` | Forçar                                        | `rm -f file.txt`     |
| `-i` | Solicitar confirmação                         | `rm -i file.txt`     |
| `-a` | Incluir arquivos ocultos no `ls`              | `ls -a`              |
| `-l` | Formato detalhado no `ls`                     | `ls -l`              |
| `-p` | Criar diretórios-pai no `mkdir`               | `mkdir -p a/b/c`     |
| `-n` | Definir quantidade de linhas em `head`/`tail` | `head -n 5 file.txt` |

---

# Conceitos Essenciais

Antes de avançar para comandos mais complexos, domine:

1. **Terminal**
2. **Comandos e argumentos**
3. `pwd`
4. `ls`
5. `cd`
6. Caminhos absolutos e relativos
7. `/` e `~`
8. `. ` e `..`
9. `touch`
10. `mkdir`
11. `cat`
12. `head`
13. `tail`
14. `less`
15. `cp`
16. `mv`
17. `rm`
18. `rmdir`
19. Flags como `-r`, `-f`, `-i`, `-a` e `-l`

> **Regra prática:** primeiro aprenda a **localizar**, depois **criar**, **visualizar**, **copiar**, **mover** e, por último, **remover** arquivos e diretórios. Isso reduz erros durante o aprendizado.
