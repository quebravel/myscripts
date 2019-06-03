#!/usr/bin/env bash

echo 'DOWNLOAD DMENU2'

if ! wget https://bitbucket.org/melek/dmenu2/downloads/dmenu2-0.2.tar.gz
then
echo 'ERRO não foi possivel baixar dmenu2 verifique sua internet.'
exit 1
fi
echo -e '\033[01;34mDmenu2 baixado!\033[0m'

sleep 1

mkdir ~/Downloads && mv dmenu2-0.2.tar.gz ~/Downloads

sleep 1

cd ~/Downloads

echo 'DESCOMPACTANDO PACOTE'

tar xfz dmenu2-0.2.tar.gz

sleep 1

cd ~/Downloads/dmenu2-0.2

sleep 1

echo 'COMPILANDO DMENU2'

## instalar
sudo make clean install

echo -e '\033[01;34mDmenu2 copilado/instalando!\033[0m'

sleep 1

cd ~/

sleep 1

echo 'REMOVENDO PASTA'

rm -r dmenu2-0.2 dmenu2-0.2.tar.gz

echo -e '\033[01;34mPasta do dmenu2 removida!\033[0m'

echo 'FIM DMENU2'
