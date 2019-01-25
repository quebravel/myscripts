#!/bin/bash

echo "instalar/configurar ranger pastas"
t1=sleep 1

euse gdk-pixbuf
$t1
emerge app-misc/ranger
ranger --copy-config=all
$t1
sed 's/set preview_images false/set preview_images true/g' ~/.config/ranger/rc.conf > ~/.config/ranger/rc.confi
$t1
sed 's/set colorscheme default/set colorscheme solarized/g' ~/.config/ranger/rc.confi > ~/.config/ranger/rc.conf
$t1
sed -i 's/mime ^audio|ogg$, terminal, has mplayer  = mplayer -- "$@"/mime ^audio|ogg$, terminal, has moc      = mocp -- "$@"/g' ~/.config/ranger/rifle.conf
cd ~/
mkdir Documentos Música Vídeo
$t1
echo 'inode/directory=ranger' >> ~/.local/share/applications/mimeapps.list
$t1
#/usr/share/applications/ranger.desktop
echo 'mostrar diretorio'
xdg-mime query default inode/directory
$t1
echo 'adicionar ranger como gerenciador de arquivos padrão'
xdg-mime default ranger.desktop application/x-directory

ranger --version

echo "ranger finalizado"
