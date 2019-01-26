#!/bin/bash

echo "intalar/configurar fontes"
sleep 1
euse -E infinality
sleep 1
emerge media-fonts/{droid,dejavu,fantasque-sans-mono,fontawesome} media-libs/{fontconfig-infinality,fontconfig}

git clone https://github.com/powerline/fonts.git --depth=1
sleep 1
sh fonts/install.sh

emerge -qn dev-python/pip
pip install --user powerline-status
sleep 1
pip install --user git+git://github.com/powerline/powerline

wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
sleep 1
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

sleep 1
mv PowerlineSymbols.otf ~/.local/share/fonts/
sleep 1
mv 10-powerline-symbols.conf /etc/fonts/conf.d/

git clone https://github.com/Tecate/bitmap-fonts.git ~/local/share/fonts/

sleep 1

fc-cache -vf ~/.local/share/fonts/

xset +fp /usr/share/fonts/75dpi/
xset fp rehash

sleep 1

eselect fontconfig enable 11-lcdfilter-default.conf 10-powerline-symbols.conf
sleep 1
eselect lcdfilter set default
sleep 1
eselect infinality set infinality

echo "fontes finalizada"
