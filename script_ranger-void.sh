#!/bin/env bash

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

ranger --version

