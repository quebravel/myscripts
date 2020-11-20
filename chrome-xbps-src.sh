#!/bin/bash

cd ~/void-packages

git pull origin master

./xbps-src pkg google-chrome

sudo xbps-install -u --repository=/home/jonatas/void-packages/hostdir/binpkgs/nonfree google-chrome


