!/bin/bash

sleep 2

sudo emerge media-libs/libsdl

sleep 1

mkdir ~/.zandronum/

cd ~/.zandronum/

sleep 1

wget -P ~/.zandronum https://zandronum.com/downloads/zandronum3.0-linux-x86_64.tar.bz2

sleep 1

tar xjfv zandronum3.0-linux-x86_64.tar.bz2

sleep 1

rm zandronum3.0-linux-x86_64.tar.bz2

sleep 1

wget -P ~/.zandronum/ https://github.com/dgeng/iwad/blob/master/doom2.7z?raw=true

sleep 1

7z x doom2.7z*

sleep 1

wget -P ~/.zandronum http://static.exciter.allfearthesentinel.net/wads/bd21test-jan02.pk3

sleep 1

#wget -P ~/.zandronum/DOOM_Music.rar https://www.moddb.com/downloads/mirror/119007/102/e65c50bbdc9fb47a1c329d666f23081e/?referer=https%3A%2F%2Fwww.moddb.com%2Fmods%2Fdoom-custom-music-pack-by-fix-03er

sleep 1

#unzip DOOM_Music.rar

echo concluido

echo execulte com ./zandronum -iwad doom2.wad -file bd21testfeb24.pk3 -file DoomMetalVol4.wad
