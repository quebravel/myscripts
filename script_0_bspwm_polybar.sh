#!/bin/bash

t1=sleep 0.5

echo "\033[41;1;37m>>>\033[0m CLONANDO dotfiles-conf/.config"

$t1

git clone https://gitlab.com/quebravel/dotfiles-conf.git ~/

$t1

cp -r ~/dotfiles-conf/.config ~/.config/

$t1

chmod u+x ~/.config/bspwm/bspwmrc ~/.config/bspwm/bspwm_resize.sh ~/.config/polybar/launch.sh

$t1

echo "ipc exibe comando shell na barra / mpd suporte a musica ncmpcpp / network suporte a internet."

$t1

sudo -E ipc mpd network

$t1

sudo emerge -auDN @world

$t1

sudo emerge x11-wm/bspwm x11-misc/{sxhkd,polybar} 

# para redimencionar a janela com o teclado [super + alt + h j k l]
#sudo emerge x11-misc/xdo

$t1

echo "executando script de instalação do dmenu2"

sh -c "$(wget https://raw.githubusercontent.com/quebravel/myscripts/master/script_dmenu2.sh -O -)"

echo -e "\033[41;1;37m>>>\033[0m BSPWM, POLYBAR e SXHKD instalados"
