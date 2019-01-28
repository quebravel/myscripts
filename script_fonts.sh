#!/bin/bash

t1=sleep 0.5

echo "intalar/configurar fontes"
$t1
euse -E infinality
$t1
emerge media-fonts/{droid,dejavu,fantasque-sans-mono,fontawesome,unifont} media-libs/{fontconfig-infinality,fontconfig}

git clone https://github.com/powerline/fonts.git --depth=1
$t1
sh fonts/install.sh

emerge -qn dev-python/pip
pip install --user powerline-status
$t1
pip install --user git+git://github.com/powerline/powerline

wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
$t1
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

$t1
mv PowerlineSymbols.otf ~/.local/share/fonts/
$t1
mv 10-powerline-symbols.conf /etc/fonts/conf.d/

git clone https://github.com/Tecate/bitmap-fonts.git ~/.local/share/fonts/

$t1

fc-cache -vf ~/.local/share/fonts/

xset +fp /usr/share/fonts/75dpi/
xset fp rehash

$t1

eselect fontconfig enable 11-lcdfilter-default.conf 10-powerline-symbols.conf
$t1
eselect lcdfilter set default
$t1
eselect infinality set infinality

echo "fontes finalizada"
