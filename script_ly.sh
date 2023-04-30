#!/bin/bash

# script para configurar o ly display manager

# cominho do arquivo de configuração
arquivo="$HOME/config.ini"
sd="sudo"

# abilitando opções 
sed -i 's/#animate = false/animate = true/g' $arquivo

sed -i 's/#animation = 0/animation = 1/g' $arquivo

sed -i 's/#xinitrc \= \~\/.xinitrc/xinitrc \= \~\/.xinitrc/g' $arquivo

# transformando arquivo xinitrc em executavel bash

[[ ! -f $HOME/.xinitrc ]] || sed -i 's/.*\#\!\/bin\/bash.*//g' $HOME/.xinitrc

sed -i 1i\ "\#\!\/bin\/bash" $HOME/.xinitrc

