
export ZSH="$HOME/.oh-my-zsh"

eval "$(starship init zsh)"

plugins=(git)

source $ZSH/oh-my-zsh.sh


# Aliases

alias grep='grep --color=auto'
alias cat='bat --style=plain --paging=never'
alias ls='exa --group-directories-first'
alias tree='exa -T'
# alias dotfiles="git --git-dir $HOME/.dotfiles/ --work-tree $HOME"
alias install='yay -S'
alias update='yay -Syy'
alias upgrade='yay'
alias search='yay -Ss'
alias clone='git clone'
alias clc='clear'
alias tmx='tmux attach | tmux'

# Colors

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=magenta'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=blue'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=blue'
ZSH_HIGHLIGHT_STYLES[path]='fg=blue'

# sudo pacman -S zsh-syntax-autosuggestions
autosuggestions=/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# sudo pacman -S zsh-syntax-highlighting
syntax=/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -f $autosuggestions ]] && source $autosuggestions
[[ -f $syntax ]] && source $syntax
