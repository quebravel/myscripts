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

mkdir Documentos Músicas Vídeos

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

sudo xbps-install -S ranger zathura-pdf-poppler w3m-img ffmpegthumbnailer mlocate

sleep 1

# Instalar mlocate e executar updatedb para poder usar fzf com procurar de arquivos ocultos no ranger
sudo updatedb

sleep 1

ranger --copy-config={rc,scope,rifle}

sleep 1

sed -i 's/set preview_images false/set preview_images true/g' ~/.config/ranger/rc.conf

sleep 1

sed -i 's/set draw_borders none/set draw_borders both/g' ~/.config/ranger/rc.conf

sleep 1

# sed -i 's/set sort natural/set sort ctime/g' ~/.config/ranger/rc.conf

# sleep 1

sed -i 's/mime ^audio|ogg$, terminal, has mplayer  = mplayer -- "$@"/mime ^audio|ogg$, terminal, has moc      = ncmpcpp -- "$@"/g' ~/.config/ranger/rifle.conf

sleep 1

sed -i '/label wallpaper, number 15, mime ^image, has feh, X = wal -i "$1"/d' ~/.config/ranger/rifle.conf

sleep 1

sed -i 's/label wallpaper, number 14, mime ^image, has feh, X = feh --bg-fill "$1"/label wallpaper, number 14, mime ^image, has feh, X = feh --bg-fill "$1"\nlabel wallpaper, number 15, mime ^image, has feh, X = wal -i "$1"/g' ~/.config/ranger/rifle.conf

sleep 1

sed -i '113,116s/#//' ~/.config/ranger/scope.sh

sleep 1

sed -i '157,160s/#//' ~/.config/ranger/scope.sh

sleep 1

sed -i 's/#set preview_script ~\/.config\/ranger\/scope.sh/set preview_script ~\/.config\/ranger\/scope.sh/g' ~/.config/ranger/rc.conf

sleep 1

sed -i '450i map mD shell -p ~/.config/ranger/mounta.sh -m; lsblk' ~/.config/ranger/rc.conf

sleep 1

sed -i '451i map uD shell -p ~/.config/ranger/mounta.sh -d; lsblk' ~/.config/ranger/rc.conf

sleep 1

sed -i '452i map ff fzf_select' ~/.config/ranger/rc.conf

sleep 1

sed -i '453i map fl fzf_locate' ~/.config/ranger/rc.conf

sleep 1


sleep 1

wget https://github.com/quebravel/myscripts/raw/master/mounta.sh -P ~/.config/ranger/

sleep 1

wget https://raw.githubusercontent.com/quebravel/myscripts/master/script_ranger_fzf && cat script_ranger_fzf >> ~/.config/ranger/commands.py && rm script_ranger_fzf

sleep 1

ranger --version

}

escolha
