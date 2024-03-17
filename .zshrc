# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/aerofractal/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias ls='exa'
alias ll='exa -l'
alias la='exa -al'
alias grep='grep --color=auto'
alias ip='ip -c'

export PATH="$HOME/.config/emacs/bin:$HOME/.bin:$PATH"

eval "$(starship init zsh)"
