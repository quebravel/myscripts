#!/bin/bash

t1=sleep 0.5

echo -e "\033[41;1;37m>>>\033[0m instalando/configurando zsh/oh-my-zsh"

$t1

su root

emerge -auDN @world

$t1

emerge -q app-shells/{zsh,zsh-completions,gentoo-zsh-completions}

$t1

echo "-> -> -> -> -> -> ESCREVA O NOME DO USUÁRIO <- <- <- <- <- <-"

read opcao

chsh -s /bin/zsh $opcao

$t1

chsh -s /bin/zsh

$t1

su jonatas

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

$t1

su root

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
$t1

su jonatas

sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="af-magic"/g' ~/.zshrc

$t1

su root

sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="nanotech"/g' /root/.zshrc

echo -e "\033[41;1;37m>>>\033[0m zsh/oh-my-zsh finalizado"
