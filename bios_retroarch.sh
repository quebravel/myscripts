#!/bin/bash

# mkdir -p ~/bios-ra
sudo pacman -Sy --needed retroarch wget unzip

wget -c https://github.com/Abdess/retroarch_system/releases/download/v20220308/RetroArch_v1.10.1.zip -P ~/.config/retroarch/

cd ~/.config/retroarch/

unzip RetroArch_v1.10.1.zip
