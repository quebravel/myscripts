#!/bin/bash

dvpack="$HOME/void-packages"

if [ -e $dvpack ]; then
    cd $dvpack
else
    git clone https://github.com/void-linux/void-packages $dvpack ; cd $dvpack
fi

pwd

./xbps-src binary-bootstrap

sleep 2

sudo xbps-install xtools

sleep 2

echo XBPS_ALLOW_RESTRICTED=yes >> ~/void-packages/etc/conf

sleep 0.5

git pull origin master

sleep 1

./xbps-src pkg discord

sudo xbps-install -u --repository=$dvpack/hostdir/binpkgs/nonfree discord


