#!/bin/bash

#variavel valor
t1='sleep 0.5'
opcao=$1

escolha(){
echo $opcao
case $opcao in
   "-g") gentoo ;;
   "--gentoo") gentoo ;;
   "-v") void ;;
   "--void") void ;;
   *) echo "Opção inválida! Use uma das seguintes opcoes:
       -g,--gentoo                  Usa script para gentoo
       -v,--void                    Usa script para void"
      exit 1 ;;
esac
}

gentoo(){


echo -e "\033[41;1;37m>>>\033[0m instalação mpd"

$t1

sudo emerge -aq media-sound/mpd

$t1

echo -e "\033[41;1;37m>>>\033[0m instalação ncmpcpp e flags = clock curl outputs taglib unicode visualizer inotify"

$t1

sudo euse -E clock curl outputs taglib unicode visualizer

$t1

sudo emerge -aq media-sound/ncmpcpp

$t1

git clone https://github.com/quebravel/dotfiles-conf.git

$t1

cp -rv ~/dotfiles-conf/dunst ~/dotfiles-conf/mpd ~/dotfiles-conf/ncmpcpp ~/.config

$t1

touch ~/.config/mpd/socket

$t1

echo -e "\033[41;1;37m>>>\033[0m instalação mpc"

$t1

sudo emerge media-sound/mpc

$t1

echo -e "\033[41;1;37m>>>\033[0m instalação dunst"

$t1

sudo emerge x11-misc/dunst

$t1

echo -e "\033[41;1;37m>>>\033[0m adicionando ao iniciar/rc-update"

$t1

sudo rc-service mpd start

$t1

sudo rc-update add mpd default

$t1

export MPD_HOST=$HOME/.config/mpd/socket
mpd

$t1

echo 'dunst &\nexport MPD_HOST=$HOME/.config/mpd/socket\nmpd --kill;mpd &' >> ~/.xinitrc

echo 'Use esses comando para iniciar ou parar se \nrc-service mpd stop\nrc-service mpd start'

echo -e "\033[41;1;37m>>>\033[0m Pronto!"

}

void(){

sudo xbps-install -S mpd mpc ncmpcpp dunst

$t1

rm -r ~/.config/{mpd,ncmpcpp,dunst}

$t1

mkdir ~/.config/mpd

$t1

mkdir ~/.config/ncmpcpp

$t1

mkdir ~/Música

$t1

mkdir ~/.config/dunst

wget -P ~/.config/mpd https://raw.githubusercontent.com/quebravel/dotfiles-conf/master/.config/mpd/mpd.conf

$t1

wget -P ~/.config/ncmpcpp https://raw.githubusercontent.com/quebravel/dotfiles-conf/master/.config/ncmpcpp/config

$t1

wget -P ~/.config/dunst https://raw.githubusercontent.com/quebravel/dotfiles-conf/master/.config/dunst/dunstrc

$t1

sudo ln -s /etc/sv/mpd /var/service

$t1

sudo sv up mpd

$t1

sudo sv status mpd

$t1

touch ~/.config/mpd/socket

$t1

sed -i '3i\dunst &\nexport MPD_HOST=$HOME/.config/mpd/socket\nmpd --kill;mpd &' ~/.xinitrc

$t1

export MPD_HOST=$HOME/.config/mpd/socket

$t1

echo '>>> MPD NPC NCMPCPP e DUNST INSTALADOS'

echo '>>> ESPERE ALGUNS SEGUNDOS DEPOIS DE EXECUTAR O NCMPCPP PARA CARREGAR O SERVIDOR'

}

escolha
