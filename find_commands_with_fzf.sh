#!/bin/zsh
#
# FileName:     find_command_with_fzf
# Author:       8ucchiman
# CreatedDate:  2023-08-13 14:18:29
# LastModified: 2023-01-23 14:11:45 +0900
# Reference:    8ucchiman.jp
# Description:  ---
#


function show_commands() {
    local snippets=$(cd ./commands; /usr/bin/find . -type f | fzf --height 100% --preview 'bat --color=always {}' )
    local command=$(cat ./commands/$snippets | awk '/Command/{print}' | cut -d'>' -f2-)
    LBUFFER="${LBUFFER}${command}"
    zle reset-prompt
}
zle -N show_commands
bindkey '^s^o' show_commands

return

