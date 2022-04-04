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

wget -P ~/.zandronum/ https://www.moddb.com/downloads/mirror/132302/115/3fc469e50341b345f227957b09fd4fa3/?referer=https%3A%2F%2Fwww.moddb.com%2Fsearch%3Fq%3Dbrutal%2Bdoom%2Bmusic%26sa.x%3D0%26sa.y%3D0
sleep 1

mv index* sound.wad

#unzip DOOM_Music.rar

echo concluido

echo execulte com ./zandronum -iwad doom2.wad -file bd21testfeb24.pk3 -file sound.wad
