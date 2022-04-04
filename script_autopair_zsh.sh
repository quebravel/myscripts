#!/bin/env bash

if [[ ! -d ~/.zsh-autopair ]]; then
  git clone https://github.com/hlissner/zsh-autopair ~/.zsh-autopair
fi


echo -e "source ~/.zsh-autopair/autopair.zsh\nautopair-init" >> ~/.zshrc
