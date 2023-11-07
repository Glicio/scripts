#!/bin/bash
# Script para iniciar uma sessão do tmux
# variável $1 é o nome do projeto
project=$1
dir=~/projects/$project

if tmux has-session -t $project 2>/dev/null; then
    echo "A sessão $project já existe. Anexando a ela..."
    # Se a sessão existe, anexa a ela
    tmux attach-session -t $project
else
# Verifica se o diretório existe
    if [ -d $dir ]; then
        echo "A sessão $project não existe. Criando uma nova sessão..."
        # Entra no diretório
        cd $dir

        # Inicia uma nova sessão do tmux
        tmux new-session -s $project -d nvim .
        tmux split-window -v
        tmux resize-pane -D 17 
        tmux send-keys -t 1 "npm run dev"
        tmux -2 attach-session -d

    else
        # Se o diretório não existe, exibe uma mensagem de erro
        echo "O diretório ~/projects/$project não existe."
    fi
fi
