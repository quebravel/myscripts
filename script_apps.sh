#!/bin/bash

echo "programas raiz"

euse -E python 256-color font-styles unicode3 mp4 mp3 ffmpeg mpeg mplayer clipboard proprietary-codecs system-ffmpeg jpeg dhcpcd nls lua X opengl pulseaudio xface png pixbuf
emerge -auDN @world
emerge app-editors/{mousepad,vim} media-plugins/alsa-plugins media-sound/{pulseaudio,alsa-utils} media-video/mplayer app-text/{odt2txt,poppler} app-arch/{unrar,rar,unzip,zip,p7zip,atool} x11-misc/{numlockx,xcompmgr} www-client/w3m media-gfx/{scrot,feh} x11-apps/{xfd,xsetroot} sys-fs/{ntfs3g,dosfstools} x11-terms/{rxvt-unicode,xfce4-terminal}  dev-util/ctags sys-libs/ncurses dev-python/pyflakes

echo "programas raiz instalado"