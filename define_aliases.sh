#!/bin/bash

# Caminho para o diretório onde o script start_tmux_session.sh está localizado
SCRIPT_DIR="$PWD"

chmod +x $SCRIPT_DIR/start_tmux.sh

PROJECTS=("vivaoshow" "sagpd" "cchalenges" "x3mrp" "vos_docs")
ALIASES=("vos" "sagpd" "cchalenges" "x3mrp" "vosd")
# Verifica se o arquivo de configuração do shell existe
if [ -f ~/.bashrc ]; then
    # Adiciona o alias ao arquivo de configuração do shell
    for i in "${!PROJECTS[@]}"; do
        echo "alias ${ALIASES[$i]}='$SCRIPT_DIR/start_tmux.sh ${PROJECTS[$i]}'" >> ~/.bashrc
        echo "Alias '${ALIASES[$i]}' foi adicionado ao seu ~/.bashrc e já está disponível para uso."
        echo "alias :q='exit'" >> ~/.bashrc
    done
    # Recarrega o arquivo de configuração do shell para aplicar as mudanças
    source ~/.bashrc
elif [ -f ~/.zshrc ]; then
    # Adiciona o alias ao arquivo de configuração do shell Zsh
    for i in "${!PROJECTS[@]}"; do
        echo "alias ${ALIASES[$i]}='$SCRIPT_DIR/start_tmux.sh ${PROJECTS[$i]}'" >> ~/.zshrc
        echo "Alias '${ALIASES[$i]}' foi adicionado ao seu ~/.zshrc e já está disponível para uso."
        echo "alias :q='exit'" >> ~/.zshrc
    done
    # Recarrega o arquivo de configuração do shell para aplicar as mudanças
    source ~/.zshrc
    echo "Alias 'vos' foi adicionado ao seu ~/.zshrc e já está disponível para uso."
else
    # Se nenhum arquivo de configuração do shell for encontrado, exibe uma mensagem de erro
    echo "Erro: Não foi possível encontrar o arquivo de configuração do shell (.bashrc ou .zshrc)."
fi
