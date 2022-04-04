#!/bin/env bash

t1='sleep 0.5'

sudo xbps-install -Sy mpd mpc ncmpcpp

$t1

rm -r ~/.config/{mpd,ncmpcpp}

$t1

mkdir -p ~/.config/mpd

$t1

mkdir -p ~/.config/ncmpcpp

$t1

mkdir -p ~/Músicas

$t1

wget -P ~/.config/mpd https://raw.githubusercontent.com/quebravel/dotfiles-conf/master/.config/mpd/mpd.conf

$t1

wget -P ~/.config/ncmpcpp https://raw.githubusercontent.com/quebravel/dotfiles-conf/master/.config/ncmpcpp/config

$t1

sudo ln -s /etc/sv/mpd /var/service

$t1

sudo sv up mpd

$t1

sudo sv status mpd

$t1

touch ~/.config/mpd/socket

$t1

export MPD_HOST=$HOME/.config/mpd/socket

$t1

echo '>>> MPD NPC NCMPCPP INSTALADOS'

echo '>>> ESPERE ALGUNS SEGUNDOS DEPOIS DE EXECUTAR O NCMPCPP PARA CARREGAR O SERVIDOR'


