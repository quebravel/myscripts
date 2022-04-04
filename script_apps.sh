#!/bin/bash

t1=sleep 0.5

echo -e "\033[41;1;37m>>>\033[0m programas raiz"

echo -e "\033[41;1;37m>>>\033[0m abilitando flags"

euse -E python 256-color font-styles unicode3 mp4 mp3 ffmpeg

$t1

euse -E mpeg mplayer clipboard proprietary-codecs system-ffmpeg 

$t1

euse -E jpeg dhcpcd nls lua X opengl pulseaudio xface png pixbuf xft

$t1

echo -e "\033[41;1;37m>>>\033[0m sessao flags finalizada"

emerge -auDN @world

$t1

echo -e "\033[41;1;37m>>>\033[0m instalando..."

emerge app-editors/{mousepad,vim}

$t1

emerge media-plugins/alsa-plugins

$t1

emerge media-sound/{pulseaudio,alsa-utils}

$t1

emerge media-video/mplayer app-text/{odt2txt,poppler}

$t1

emerge app-arch/{unrar,rar,unzip,zip,p7zip,atool}

$t1

emerge x11-misc/{numlockx,urxvt-perls,urxvt-font-size}

$t1

emerge www-client/w3m media-gfx/{scrot,feh}

$t1

emerge x11-apps/{xfd,xsetroot}

$t1

emerge sys-fs/{ntfs3g,dosfstools}

$t1

emerge x11-terms/rxvt-unicode

$t1

emerge dev-util/ctags sys-libs/ncurses dev-python/pyflakes

$t1

sh -c "$(wget https://raw.githubusercontent.com/quebravel/myscripts/master/script_redshift.sh -O -)"

$t1

echo -e "\033[41;1;37m>>>\033[0m programas raiz instalados"
