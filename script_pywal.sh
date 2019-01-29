#!/bin/bash

git clone https://github.com/dylanaraps/pywal
cd pywal

emerge pip

pip3 install --user .

echo "add configuração ao .zshrc"

echo 'export PATH="${PATH}:${HOME}/.local/bin/"}' >> ~/.zshrc
echo 'cat ~/.cache/wal/sequences' >> ~/.zshrc

echo 'add configuração ao bspwmrc'
echo 'feh --bg-tile "$(< "${HOME}/.cache/wal/wal")"' >> ~/.config/bspwm/bspwmrc

echo 'agora UTILIZE wal -i ~caminho do wallpapers de sua escolha'

echo 'completo'
