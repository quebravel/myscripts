#!/bin/bash

sleep 2

sudo emerge media-libs/libsdl

sleep 1

mkdir ~/.zandronum/
cd ~/.zandronum/
sleep 1

wget https://zandronum.com/downloads/zandronum3.0-linux-x86_64.tar.bz2

sleep 1

tar xjfv zandronum3.0-linux-x86_64.tar.bz2

sleep 1

rm zandronum3.0-linux-x86_64.tar.bz2

sleep 1

wget http://doomgod.com/wads/iwads/doom2.7z

sleep 1

7z x doom2.7z

sleep 1

rm doom2.7z

sleep 1

wget http://download1517.mediafire.com/tuc37swp3iwg/1a4cpb3px0a2b1j/bd21test-jan02.zip

sleep 1

unzip bd21test-jan02.zip

sleep 1

wget http://www.moddb.com/downloads/mirror/61238/102/54cb0dd4b64ac3965edd7653248ad0c8/?referer=http%3A%2F%2Fwww.moddb.com%2Fmods%2Fbrutal-doom%2Fdownloads

mv index* sound.zip

sleep 1

unzip sound.zip

echo concluido

echo execulte com ./zandronum -iwad doom2.wad -file bd21testfeb24.pk3 -file DoomMetalVol4.wad
