#!bin/bash

t1=sleep 0.5

echo "\033[41;1;37m>>>\033[0m CLONANDO dotfiles-conf/.config"

git clone https://gitlab.com/quebravel/dotfiles-conf.git ~/
$t1
cp -r ~/dotfiles-conf/.config ~/.config/
$t1
chmod +x ~/.config/bspwm/bspwmrc ~/.config/polybar/launch.sh
$t1
sudo -E ipc mpd network
$t1
sudo emerge -auDN @world

sudo emerge x11-wm/bspwm x11-misc/{sxhkd,polybar} 

echo -e "\033[41;1;37m>>>\033[0m BSPWM, POLYBAR e SXHKD instalados"