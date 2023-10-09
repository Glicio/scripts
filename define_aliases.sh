#!/bin/bash

# Caminho para o diretório onde o script start_tmux_session.sh está localizado
SCRIPT_DIR="$PWD"

# Alias que será adicionado ao arquivo de configuração do shell
ALIAS_COMMAND="alias vos='$SCRIPT_DIR/start_tmux.sh'"

chmod +x $SCRIPT_DIR/start_tmux.sh

PROJECTS=("vivaoshow" "sagpd")
ALIASES=("vos" "sagpd")
# Verifica se o arquivo de configuração do shell existe
if [ -f ~/.bashrc ]; then
    # Adiciona o alias ao arquivo de configuração do shell
    for i in "${!PROJECTS[@]}"; do
        echo "alias ${ALIASES[$i]}='$SCRIPT_DIR/start_tmux.sh ${PROJECTS[$i]}'" >> ~/.bashrc
        echo "Alias '${ALIASES[$i]}' foi adicionado ao seu ~/.bashrc e já está disponível para uso."
    done
    # Recarrega o arquivo de configuração do shell para aplicar as mudanças
    source ~/.bashrc
elif [ -f ~/.zshrc ]; then
    # Adiciona o alias ao arquivo de configuração do shell Zsh
    for i in "${!PROJECTS[@]}"; do
        echo "alias ${ALIASES[$i]}='$SCRIPT_DIR/start_tmux.sh ${PROJECTS[$i]}'" >> ~/.zshrc
        echo "Alias '${ALIASES[$i]}' foi adicionado ao seu ~/.zshrc e já está disponível para uso."
    done
    # Recarrega o arquivo de configuração do shell para aplicar as mudanças
    source ~/.zshrc
    echo "Alias 'vos' foi adicionado ao seu ~/.zshrc e já está disponível para uso."
else
    # Se nenhum arquivo de configuração do shell for encontrado, exibe uma mensagem de erro
    echo "Erro: Não foi possível encontrar o arquivo de configuração do shell (.bashrc ou .zshrc)."
fi