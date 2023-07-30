#!/bin/sh


sudo pacman -Scc
sudo pacman -Syyu
sudo pacman-key --refresh-keys
sudo pacman -Sy archlinux-keyring && sudo pacman -Su
sudo pacman -S archlinux-keyring
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman -Rscn $(pacman -Qdtq)
sudo pacman -Syuw
