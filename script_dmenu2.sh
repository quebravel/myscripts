#!/usr/bin/env bash

# sh -c "$(wget -O- https://raw.githubusercontent.com/quebravel/myscripts/master/script_dmenu2.sh)"

echo 'DOWNLOAD DMENU2'

if ! wget https://bitbucket.org/melek/dmenu2/downloads/dmenu2-0.2.tar.gz
then
echo 'ERRO não foi possivel baixar dmenu2 verifique sua internet.'
exit 1
fi
echo -e '\033[01;34mDmenu2 baixado!\033[0m'

sleep 1

mkdir ~/Downloads; mv dmenu2-0.2.tar.gz ~/Downloads

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

## mudar cores com pywal

#echo '. "${HOME}/.cache/wal/colors.sh"' | tee >> ~/.zshrc

#echo '#!/bin/env bash\n\n# Import the colors\n\n. "${HOME}/.cache/wal/colors.sh"\n\n~/Downloads/dmenu2-0.2/dmenu_run -h 17 -y 22 -nb "$color0" -nf "$color4" -sb "$color4" -sf "$color0" -fn "ohsnap" -p "dmenu2"' | tee ~/Downloads/dmenu2-0.2/dmen.sh

#chmod +x ~/Downloads/dmenu2-0.2/dmen.sh

# em ~/.config/sxhkd/sxhkdrc muder o 'super + r' para lançar o '~/Downloads/dmenu2-0.2/dmen.sh'

echo -e '\033[01;34mPasta do dmenu2 removida!\033[0m'

echo 'FIM DMENU2'
