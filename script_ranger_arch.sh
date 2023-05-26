#!/bin/bash

[[ ! -f ~/.config/ranger/rc.conf ]] || rm  ~/.config/ranger/rc.conf
[[ ! -f ~/.config/ranger/scope.sh ]] || rm  ~/.config/ranger/scope.sh
[[ ! -f ~/.config/ranger/rifle.conf ]] || rm  ~/.config/ranger/rifle.conf

ranger --copy-config=rc
ranger --copy-config=scope
ranger --copy-config=rifle

sleep 2

sed -i 's/set preview_images false/set preview_images true/g' ~/.config/ranger/rc.conf

sleep 1

sed -i 's/set draw_borders none/set draw_borders both/g' ~/.config/ranger/rc.conf


sed -i 's/set preview_images_method w3m/set preview_images_method ueberzug/g' ~/.config/ranger/rc.conf

# sed -i 's/set sort natural/set sort ctime/g' ~/.config/ranger/rc.conf


sed -i 's/mime ^audio|ogg$, terminal, has mplayer  = mplayer -- "$@"/mime ^audio|ogg$, terminal, has moc      = ncmpcpp -- "$@"/g' ~/.config/ranger/rifle.conf

sleep 1

sed -i '/label wallpaper, number 15, mime ^image, has feh, X = wal -i "$1"/d' ~/.config/ranger/rifle.conf

sleep 1

sed -i 's/label wallpaper, number 14, mime ^image, has feh, X = feh --bg-fill "$1"/label wallpaper, number 14, mime ^image, has feh, X = feh --bg-fill "$1"\nlabel wallpaper, number 15, mime ^image, has feh, X = wal -i "$1"/g' ~/.config/ranger/rifle.conf


sed -i '113,116s/#//' ~/.config/ranger/scope.sh


sed -i '157,160s/#//' ~/.config/ranger/scope.sh


sed -i 's/#set preview_script ~\/.config\/ranger\/scope.sh/set preview_script ~\/.config\/ranger\/scope.sh/g' ~/.config/ranger/rc.conf


ranger --version
