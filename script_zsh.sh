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

alias ip="ip -s -c -h a"

# lsd
#alias ls='lsd'
#alias l='ls -l'
#alias la='ls -a'
#alias lla='ls -la'
#alias lt='ls --tree'
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
