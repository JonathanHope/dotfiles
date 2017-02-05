#------------------------------
# Prompt
#------------------------------

PROMPT='%F{magenta}⬢ ━❰%f %{%B%F{green}%}%n%{%f%b%}%F{cyan} %B➤%b%f %{%B%F{red}%}%m%{%f%b%} %F{magenta}❱━⬢%f  %B%F{yellow}𝛌%f%b '
RPROMPT='%F{magenta}⬢ ━❰%f %{%B%F{blue}%}%~%{%f%b%} %F{magenta}❱━⬢%f'

#------------------------------
# Colors
#------------------------------

eval $(dircolors ~/.lscolors)

#------------------------------
# Completion
#------------------------------

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

#------------------------------
# Antigen
#------------------------------

source ~/antigen/antigen.zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen apply

#------------------------------
# Aliases / Functions
#------------------------------

alias hostip='wget http://checkip.dyndns.org/ -O - -o /dev/null | cut -d: -f 2 | cut -d\< -f 1'
alias magit='emacs --eval "(revert-default-directory)" --eval "(magit-status)" --eval "(delete-other-windows)"'
alias udm='udisksctl mount -b /dev/sdb1'
alias udu='udisksctl unmount -b /dev/sdb1'
alias restart='sudo shutdown -r now'

# usage: extract <file name>
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

#usage find-package <file name>
function find-package ()
{
    nix-env -qa \* -P | grep -i "$1" | grep -o "^[^ ]*"
}


#usage find-package <package name>
function find-file ()
{
    find . ! -readable -prune -o -name "$1" | grep "$1";
}
