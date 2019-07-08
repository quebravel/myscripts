#!/bin/env bash

sudo xbps-install -S pywal

sleep 1

echo "cat ~/.cache/wal/sequences\nsource ~/.cache/wal/colors-tty.sh\n. "${HOME}/.cache/wal/colors.sh"" >> $HOME/.zshrc

sleep 1

echo "wal-tile() {\n    wal -n -i "$@"\n    feh --bg-tile "$(< "${HOME}/.cache/wal/wal")"\n}" >> $HOME/.zshrc

wal -R

echo '>>> PYWAL INSTALADO E CONFIGURADO!!!!'

echo 'EXECUTE para iniciar o pywal >>>> wal -i <wallpaper> -n'
