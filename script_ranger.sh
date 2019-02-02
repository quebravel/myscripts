#!/bin/bash

t1=sleep 0.5

echo -e "\033[41;1;37m>>>\033[0m instalar/configurar ranger pastas"

$t1

sudo euse -E gdk-pixbuf

$t1

sudo emerge app-misc/ranger

$t1

ranger --copy-config=all

$t1

sed 's/set preview_images false/set preview_images true/g' ~/.config/ranger/rc.conf > ~/.config/ranger/rc.confi

$t1

sed 's/set colorscheme default/set colorscheme solarized/g' ~/.config/ranger/rc.confi > ~/.config/ranger/rc.conf

$t1

sed -i 's/mime ^audio|ogg$, terminal, has mplayer  = mplayer -- "$@"/mime ^audio|ogg$, terminal, has moc      = mocp -- "$@"/g' ~/.config/ranger/rifle.conf

$t1

cd ~/

$t1

mkdir Documentos Música Vídeo

$t1

echo -e "\033[41;1;37m>>>\033[0m instalando o xterm para o navegador abrir a pasta downloads \n infelizmente o rxvt-unicode não abre ainda."

$t1

sudo emerge xterm

$t1

#/usr/share/applications/ranger.desktop

echo -e "\033[41;1;37m>>>\033[0m mostrar diretorio"

$t1

xdg-mime query default inode/directory

$t1

echo -e "\033[41;1;37m>>>\033[0m adicionar ranger como gerenciador de arquivos padrão"

$t1

xdg-mime default ranger.desktop application/x-directory

$t1

ranger --version

echo -e "\033[41;1;37m>>>\033[0m ranger file manager finalizado"
