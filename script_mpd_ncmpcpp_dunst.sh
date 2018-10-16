#!/bin/bash
# instalação mpd
sudo emerge -aq media-sound/mpd

# instalação ncmpcpp (flags = clock curl outputs taglib unicode visualizer)
sudo emerge -aq media-sound/ncmpcpp

git clone https://github.com/quebravel/dotfiles-conf.git

cd ~/dotfiles-conf/.config

cp -rv dunst ~/.config

cd ~/dotfiles-conf/

cp -rv .mpd .mcmpcpp ~/

touch ~/.mpd/socket

# instalação mpc
sudo emerge media-sound/mpc

# instalação dunst
sudo emerge x11-misc/dunst

# adicionando ao iniciar
sudo rc-service mpd start

sudo rc-update add mpd default

echo 'dunst &' >> ~/.xinitrc

echo 'Pronto!'
