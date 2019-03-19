#!/bin/bash

t1=sleep 0.5

echo -e "\033[41;1;37m>>>\033[0m intalar/configurar fontes"

$t1

sudo euse -E infinality xft

$t1

sudo emerge media-fonts/{droid,dejavu,fantasque-sans-mono,fontawesome,unifont,powerline-symbols} media-libs/{fontconfig-infinality,fontconfig}

# não instalar powerline manualmente instalar pelo pacote da distribuição.

git clone https://github.com/powerline/fonts.git --depth=1

$t1

cd

$t1

sh fonts/install.sh

$t1

: ' comentario

emerge -qn dev-python/pip

$t1

pip install --user powerline-status

$t1

pip install --user git+git://github.com/powerline/powerline

$t1

wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf

$t1

wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

$t1

mv PowerlineSymbols.otf ~/.local/share/fonts/

$t1

mv 10-powerline-symbols.conf /etc/fonts/conf.d/
'

git clone https://github.com/Tecate/bitmap-fonts.git ~/.local/share/fonts/bitmap-fonts

$t1

fc-cache -vf ~/.local/share/fonts/

$t1

xset +fp ~/.local/share/fonts/

xset fp rehash

$t1

sudo eselect fontconfig enable 11-lcdfilter-default.conf 10-powerline-symbols.conf 70-yes-bitmaps.conf 52-infinality.conf

$t1

sudo select lcdfilter set default

$t1

sudo eselect infinality set infinality

echo -e "\033[41;1;37m>>>\033[0m configuracao de fontes finalizada"
