set fish_greeting ""

# Aliases

alias grep "grep --color=auto"
alias cat "bat --style=plain --paging=never"
alias ls "exa --group-directories-first"
alias l "exa --group-directories-first -al"
alias tree "exa -T"
alias clc='clear'
alias tmx='tmux attach | tmux'
# Prompt

starship init fish | source
