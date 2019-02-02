#!/bin/bash

t1=sleep 0.5

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

cd ~/dotfiles-conf/.config

$t1

cp -rv dunst ~/.config

$t1

cd ~/dotfiles-conf/

$t1

cp -rv .mpd .mcmpcpp ~/

$t1

touch ~/.mpd/socket

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

echo 'dunst &' >> ~/.xinitrc

echo -e "\033[41;1;37m>>>\033[0m Pronto!"
