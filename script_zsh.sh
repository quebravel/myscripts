#!/bin/bash

t1=sleep 0.5

$t1

Menu(){

    echo -e "\033[1;34m |||||              Void ou Gentoo linux?                ||||| \033[0m"
    echo
    echo -e "\033[1;31;40m[ 1 ]\033[0m Instalar/Configurar Void"
    echo -e "\033[1;35;40m[ 2 ]\033[0m Instalar/Configurar gentoo"
    echo -e "\033[1;36;40m[ x ]\033[0m Sair"
    echo
    echo -n "Qual a opção desejada? "
    read opcao
    case $opcao in
        1) Void ;;
        2) Gentoo ;;
        x) exit ;;
        *) "Opção desconhecida." ; echo ; Menu ;;
    esac

}

Void(){

sudo xbps-install -S zsh zsh-{autosuggestions,completions}
#,syntax-highlighting
echo "-> -> -> -> -> -> ESCREVA O NOME DO USUÁRIO <- <- <- <- <- <-"

read opcao

chsh --shell /bin/zsh $opcao

sudo chsh --shell /bin/zsh root

echo '

export EDITOR="nvim"
export TERMINAL="urxvt"
export BROWSER="firefox"
export READER="zathura"
export SHELL="zsh"
export XDG_CURRENT_DESKTOP="bspwm"

### luke smith vi mode

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
# HISTFILE=~/.cache/zsh/history

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'l' vi-forward-char
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Alias

# shutdown
alias shutdown="sudo shutdown"
alias npolybar="nvim ~/.config/polybar/config"
alias nbspwm="nvim ~/.config/bspwm/bspwmrc"
alias nsxhkd="nvim ~/.config/sxhkd/sxhkdrc"
alias n="nvim"

# xbps
alias xi="sudo xbps-install -S"
alias xiu="sudo xbps-install -Su"
alias xr="sudo xbps-remove -R"
alias xq="xbps-query -Rs"
alias xo="sudo xbps-remove -Oo"

alias ip="ip -s -c -h a"

# lsd
alias ls="lsd --icon never"
alias l="lsd -l --icon never"
alias la="lsd -a --icon never"
alias lla="lsd -la --icon never"
alias lt="lsd --tree --icon never"
alias ll="lsd -l --icon never --total-size"

#fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# cda - including hidden directories
cda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}
# na - including hidden directories
na() {
  local dir
  fil=$(find ${1:-.} -type f 2> /dev/null | fzf +m) && nvim "$fil"
}
# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -r 's/ *[0-9]*\*? *//' | sed -r 's/\\/\\\\/g')
}
# fkill - kill process
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}


' >> $HOME/.zshrc


}

Gentoo(){

sudo emerge -auDN @world

$t1

sudo emerge -q app-shells/{zsh,zsh-completions,gentoo-zsh-completions}

$t1

echo "-> -> -> -> -> -> ESCREVA O NOME DO USUÁRIO <- <- <- <- <- <-"

read opcao

chsh -s /bin/zsh $opcao

}

Menu

$t1

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

$t1

sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="af-magic"/g' $HOME/.zshrc

$t1

wget https://raw.github.com/trapd00r/LS_COLORS/master/LS_COLORS -O $HOME/.dircolors

$t1

echo 'eval $(dircolors -b $HOME/.dircolors)' >> $HOME/.zshrc

$t1

echo '
export EDITOR="nvim"
export TERMINAL="urxvt"
export BROWSER="qutebrowser"
export READER="zathura"
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
' >> $HOME/.zshrc

$t1

. $HOME/.zshrc

$t1

echo -e "\033[41;1;37m>>>\033[0m zsh/oh-my-zsh finalizado"
