#!/bin/bash

# Change ls to work with lsd for better colored output
alias l="lsd --color always --icon always --sort extension --hyperlink always --group-directories-first"
alias ls="l"
alias ld='lsd --color=always --icon=always --directory-only --hyperlink=always'
alias la="lsd --color=always --icon=always --group-directories-first -A --hyperlink=always"
alias ll="lsd --color=always --icon=always --group-directories-first -A -l --hyperlink=always"
alias l.="lsd --color=always --icon=always --group-directories-first -A ^.*"

# quick sourcing files
alias sbash="source $BDOTDIR/.bashrc"
alias szsh="source $ZDOTDIR/.zshrc"
alias skitty="source $KDOTDIR/kitty.conf"

# Basic Aliases
alias updb="sudo updatedb"

# Nala (replacemnt for apt) aliases
alias sni="sudo nala install"
alias sns="sudo nala search"
alias snl="sudo nala list"
alias snli="nala list --installed"
alias snu="sudo nala update"
alias snuu="sudo nala update && sudo nala upgrade -y"
alias nkitty="$EDITOR $KDOTDIR $KDOTDIR/kitty.conf"

# Aliases for Note command
alias nn="new_note"
alias n="notes"
alias cn="clear_notes"
alias sn="search_notes"
alias cb='echo "$(xclip -o)"'
alias nnc='new_note $(xclip -o)'

# Quickly change diirectory
# alias cd="c"
alias ..="cd .."
alias ...="builtin cd .. && cd .."
alias ....="builtin cd .. && builtin cd .. && cd .."

# Edit files quickly
alias ealiases="$EDITOR $BDOTDIR/aliases.bash"
alias ebashrc="$EDITOR $BDOTDIR/.bashrc"
alias eenv="$EDITOR $BDOTDIR/env.bash"
alias efunctions="$EDITOR $BDOTDIR/functions.bash"

# Easy search aliases
alias s="search"
alias yt="youtube"


# ssh to digital ocean
# alias sshrdo="kitty +kitten ssh root@$(cat $HOME/.DigitalOcean)"
# alias sshudo="kitty +kitten ssh elliot@$(cat $HOME/.DigitalOcean)"


# Docker aliases
alias dr="docker run"
alias drit="docker run -it"
alias di="docker images"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias drm="docker rm"
alias drmi="docker rmi"
alias dcp="docker container prune"

alias ff="firefox"
alias q="exit"

alias localip="ip -o route get to 1.1.1.1 | sed -n 's/.*src \([0-9.]\+\).*/\1/p'"
alias myip="curl ifconfig.co"

#Cleanup orphaned packages & cache
# alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
# alias cleancache='sudo pacman -Scc'

#get the error messages from journalctl
# alias jctl='journalctl -p 3 -xb'

#Recent Installed Packages
# alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"


