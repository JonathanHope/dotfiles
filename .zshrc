#-------------------------------------------------
# File: .zshrc
# Author: Jonathan Hope
# License: MIT
# Summary: This is my zsh config
#-------------------------------------------------

#------------------------------
# History
#------------------------------

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

#------------------------------
# Auto Complete
#------------------------------

autoload -U compinit promptinit
compinit
promptinit

zstyle ':completion:*:pacman:*' force-list always
zstyle ':completion:*:*:pacman:*' menu yes select

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always

zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*'   force-list always

#------------------------------
# Prompt
#------------------------------

autoload -U colors && colors

PROMPT='[%{%F{green}%}%n%{%f%}@%{%F{red}%}%m%{%f%}]: '
RPROMPT='[%{%F{blue}%}%~%{%f%}]'

#------------------------------
# Aliases
#------------------------------

# General
alias ls='ls --color=auto -F -la'
alias sudo='sudo '
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'
alias top='htop'

# Music
alias rip-cd='abcde'
alias update-music-db='beet import ~/Music'

# Network
alias hostip='wget http://checkip.dyndns.org/ -O - -o /dev/null | cut -d: -f 2 | cut -d\< -f 1'
alias ls-wifi='nmcli dev wifi list'
alias ls-con='nmcli con list'

# Storage
alias ls-dev='ls /media'

#------------------------------
# Variables
#------------------------------

export EDITOR="emacs"
export TERM="xterm"

#------------------------------
# Functions
#------------------------------

# usage: extract <filename>
extract () 
{
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       rar x $1       ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

# Network

touch-wifi ()
{
  # TODO
}

rm-con ()
{
  nmcli con delete uuid $1;
}

# Storage

umount-dev ()
{
  udiskie-umount --detach /media/$1;
}

cd-dev ()
{
  cd /media/$1
}

github-clone ()
{
  git clone ssh://git@github.com/$1/$2.git
}
