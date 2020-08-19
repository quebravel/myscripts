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

#DT
### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;      
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Changing "ls" to "exa"
alias ls='exa -al --color-scale --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color-scale --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color-scale --color=always --group-directories-first'  # long format
alias lt='exa -aT --color-scale --color=always --group-directories-first' # tree listing
alias l.='exa -a --color-scale | egrep "^\."'

# youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "

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
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf -e +s --tac | sed -r 's/ *[0-9]*\*? *//' | sed -r 's/\\/\\\\/g')
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
# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
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
