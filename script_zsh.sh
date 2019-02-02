#!/bin/bash

t1=sleep 0.5

echo "instalando/configurando zsh/oh-my-zsh"

$t1

emerge -auDN @world

$t1

emerge -q app-shells/{zsh,zsh-completions,gentoo-zsh-completions}

$t1

echo "ESCREVA O NOME DO USUÁRIO"

read opcao

chsh -s /bin/zsh $opcao

$t1

chsh -s /bin/zsh

$t1

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

$t1

sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

echo "zsh/oh-my-zsh finalizado"
