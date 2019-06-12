#/bin/env bash

sudo xbps-install -S mpd mpc ncmpcpp dunst

sleep 1

rm -r ~/.config/{mpd,ncmpcpp,dunst}

sleep 1

mkdir ~/.config/mpd

sleep 1

mkdir ~/.config/ncmpcpp

sleep 1

mkdir ~/Músicas

sleep 1

mkdir ~/.config/dunst

wget -P ~/.config/mpd https://raw.githubusercontent.com/quebravel/dotfiles-conf/master/.config/mpd/mpd.conf

sleep 1

wget -P ~/.config/ncmpcpp https://raw.githubusercontent.com/quebravel/dotfiles-conf/master/.config/ncmpcpp/config

sleep 1

wget -P ~/.config/dunst https://raw.githubusercontent.com/quebravel/dotfiles-conf/master/.config/dunst/dunstrc

sleep 1

sudo ln -s /etc/sv/mpd /var/service

sleep 1

sudo sv up mpd

sleep 1

sudo sv status mpd

sleep 1

touch ~/.config/mpd/socket

sleep 1

sed -i '3i\dunst &\nexport MPD_HOST=$HOME/.config/mpd/socket\nmpd --kill;mpd &' ~/.xinitrc

sleep 1

export MPD_HOST=$HOME/.config/mpd/socket

sleep 1

echo '>>> MPD NPC NCMPCPP e DUNST INSTALADOS'

echo '>>> ESPERE ALGUNS SEGUNDOS DEPOIS DE EXECUTAR O NCMPCPP PARA CARREGAR O SERVIDOR'
