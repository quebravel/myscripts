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

echo "add configuração ao .zshrc"

$t1

echo 'export PATH="${PATH}:${HOME}/.local/bin/"}' >> ~/.zshrc

$t1

echo 'cat ~/.cache/wal/sequences' >> ~/.zshrc

$t1

echo 'add configuração ao bspwmrc'

$t1

echo 'feh --bg-tile "$(< "${HOME}/.cache/wal/wal")"' >> ~/.config/bspwm/bspwmrc

$t1

echo 'agora UTILIZE wal -i ~caminho do wallpapers de sua escolha'

$t1

echo 'instalacao e configuracao do pywal completo'
