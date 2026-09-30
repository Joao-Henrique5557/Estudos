#!/bin/bash

pastaProjetos="$HOME/projetos"
count=1
input=""

# Limpar/criar lista
> listaProjetos.txt

# Exibir e armazenar a lista de projetos
for projeto in "$pastaProjetos"/*; do
    echo "$count, $projeto"
    echo "$count, $projeto" >> listaProjetos.txt
    count=$((count + 1))
done

# Loop com entrada de números
while [ "$input" != "quit" ]; do
    read -p "Digite o número do projeto que deseja abrir (ou quit): " input

    if [ "$input" = "quit" ]; then
        break
    fi

    projeto=$(awk -F', ' -v numero="$input" '$1 == numero {print $2}' listaProjetos.txt)

    if [ -n "$projeto" ]; then
        code "$projeto"
    else
        echo "Número de projeto inválido."
    fi
done

# Limpar lista
> listaProjetos.txt