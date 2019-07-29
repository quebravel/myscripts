#!/bin/bash

#variavel valor
t1='sleep 0.5'
opcao=$1

escolha(){
echo $opcao
case $opcao in
   "-g") gentoo ;;
   "--gentoo") gentoo ;;
   "-v") void ;;
   "--void") void ;;
   *) echo "Opção inválida! Use uma das seguintes opcoes:
       -g,--gentoo                  Usa script para gentoo
       -v,--void                    Usa script para void"
      exit 1 ;;
esac
}


gentoo(){

echo -e "\033[41;1;37m>>>\033[0m instalar/configurar ranger pastas"

$t1

euse -E gdk-pixbuf

$t1

emerge app-misc/ranger

$t1

ranger --copy-config=all

$t1

sed -i 's/set preview_images false/set preview_images true/g' ~/.config/ranger/rc.conf

$t1

sed -i 's/set colorscheme default/set colorscheme solarized/g' ~/.config/ranger/rc.conf

$t1

sed -i 's/set draw_borders none/set draw_borders both/g' ~/.config/ranger/rc.conf

$t1

sed -i 's/mime ^audio|ogg$, terminal, has mplayer  = mplayer -- "$@"/mime ^audio|ogg$, terminal, has moc      = mocp -- "$@"/g' ~/.config/ranger/rifle.conf

$t1

sed -i '/label wallpaper, number 15, mime ^image, has feh, X = wal -i "$1"/d' ~/.config/ranger/rifle.conf

$t1

sed -i 's/label wallpaper, number 14, mime ^image, has feh, X = feh --bg-fill "$1"/label wallpaper, number 14, mime ^image, has feh, X = feh --bg-fill "$1"\nlabel wallpaper, number 15, mime ^image, has feh, X = wal -i "$1"/g' ~/.config/ranger/rifle.conf

$t1

cd ~/

$t1

mkdir Documentos Música Vídeo

$t1

echo -e "\033[41;1;37m>>>\033[0m instalando o xterm para o navegador abrir a pasta downloads \n infelizmente o rxvt-unicode não abre ainda."

$t1

emerge xterm

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
}

void(){

sudo xbps-install -S ranger zathura-pdf-poppler w3m-img ffmpegthumbnailer

sleep 1

ranger --copy-config={rc,scope,rifle}

sleep 1

sed -i 's/set preview_images false/set preview_images true/g' ~/.config/ranger/rc.conf

sleep 1

sed -i 's/set draw_borders none/set draw_borders both/g' ~/.config/ranger/rc.conf

sleep 1

sed -i 's/mime ^audio|ogg$, terminal, has mplayer  = mplayer -- "$@"/mime ^audio|ogg$, terminal, has moc      = ncmpcpp -- "$@"/g' ~/.config/ranger/rifle.conf

sleep 1

sed -i '/label wallpaper, number 15, mime ^image, has feh, X = wal -i "$1"/d' ~/.config/ranger/rifle.conf

sleep 1

sed -i 's/label wallpaper, number 14, mime ^image, has feh, X = feh --bg-fill "$1"/label wallpaper, number 14, mime ^image, has feh, X = feh --bg-fill "$1"\nlabel wallpaper, number 15, mime ^image, has feh, X = wal -i "$1"/g' ~/.config/ranger/rifle.conf

sleep 1

sed -i '113s/#//' ~/.config/ranger/scope.sh

sleep 1

sed -i '114s/#//' ~/.config/ranger/scope.sh

sleep 1

sed -i '115s/#//' ~/.config/ranger/scope.sh

sleep 1

sed -i '116s/#//' ~/.config/ranger/scope.sh

sleep 1

sed -i '450i map uD shell -p sudo umount -Rf /mnt; lsblk' ~/.config/ranger/rc.conf

sleep 1

ranger --version

}

escolha