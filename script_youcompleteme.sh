#!/bin/bash

cd ~/.config/nvim/plugged/youcompleteme

sudo xbps-install -S cmake python3-devel base-devel

python3.9 install.py --all
