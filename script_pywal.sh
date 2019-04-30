#!/bin/bash

t1=sleep 0.5

git clone https://github.com/dylanaraps/pywal

$t1

cd pywal

$t1

emerge pip

$t1

pip3 install --user .

$t1

echo -e "\033[41;1;37m>>>\033[0m add configuração ao .zshrc"

$t1

echo 'export PATH="${PATH}:${HOME}/.local/bin/"}' >> ~/.zshrc

$t1

#echo 'cat ~/.cache/wal/sequences' >> ~/.zshrc
echo 'wal-tile() {
     wal -n -i "$@"
     feh --bg-tile "$(< "${HOME}/.cache/wal/wal")"
}' >> ~/.zshrc

$t1

echo -e "\033[41;1;37m>>>\033[0m add configuração ao bspwmrc"

$t1

echo 'feh --bg-scale "$(< "${HOME}/.cache/wal/wal")"' >> ~/.config/bspwm/bspwmrc

$t1

echo -e "\033[41;1;37m>>>\033[0m agora UTILIZE wal -i ~caminho do wallpapers de sua escolha"

$t1

echo -e "\033[41;1;37m>>>\033[0m instalacao e configuracao do pywal completo"
