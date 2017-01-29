#------------------------------
# Exports
#------------------------------

export LANG=en_US.UTF-8
export EDITOR='emacs'
export SSH_KEY_PATH="~/.ssh/rsa_id"

#------------------------------
# Prompt
#------------------------------

PROMPT='[%{%F{green}%}%n%{%f%}@%{%F{red}%}%m%{%f%}]: '
RPROMPT='[%{%F{blue}%}%~%{%f%}]'

#------------------------------
# Completion
#------------------------------

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

#------------------------------
# Aliases / Functions
#------------------------------

alias hostip='wget http://checkip.dyndns.org/ -O - -o /dev/null | cut -d: -f 2 | cut -d\< -f 1'
alias magit='emacs --eval "(revert-default-directory)" --eval "(magit-status)" --eval "(delete-other-windows)"'
alias udm='udisksctl mount -b /dev/sdb1'
alias udu='udisksctl unmount -b /dev/sdb1'
alias restart='sudo shutdown -r now'

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
          *.7z)        7zr x $1        ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}

# usage up <number>
function up {
    if [[ "$#" < 1 ]] ; then
        cd ..
    else
        CDSTR=""
        for i in {1..$1} ; do
            CDSTR="../$CDSTR"
        done
        cd $CDSTR
    fi
}

#usage nix? <package name>
function search-packages ()
{
    nix-env -qa \* -P | grep -i "$1" | less;
}
