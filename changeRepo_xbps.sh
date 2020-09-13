#!/bin/bash

opcao=$1

sudo mkdir -p /etc/xbps.d

sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/

EUFinland(){
    sudo xbps-install -S && sudo xbps-query -L

}

USAChicago(){
    sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://mirrors.servercentral.com/voidlinux/|g' /etc/xbps.d/*-repository-*.conf

    sudo xbps-install -S && sudo xbps-query -L

}

USAKansasCity(){
    sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://alpha.us.repo.voidlinux.org/|g' /etc/xbps.d/*-repository-*.conf

    sudo xbps-install -S && sudo xbps-query -L

}

USANewYork(){
    sudo sed -i 's|https://alpha.de.repo.voidlinux.org|https://mirror.clarkson.edu/voidlinux/|g' /etc/xbps.d/*-repository-*.conf

    sudo xbps-install -S && sudo xbps-query -L

}

help(){
   echo "Script para mudar mirror do Void Linux.

Uso:   ./changeRepo_xbps.sh [opções]
Opções:
       -h, --help    Esta ajuda.
       -euf          EU: Finland.
       -usc          USA: Chicago.
       -usk          USA: Kansas City.
       -usn          USA: New York."
}

repositorio(){
case $opcao in
   -euf ) EUFinland ;;
   -usc ) USAChicago ;;
   -usk ) USAKansasCity ;;
   -usn ) USANewYork ;;
   -h | --help ) help ;;
   *) echo "Opção inválida! Use uma das seguintes opções:
       -euf          EU: Finland.
       -usc          USA: Chicago.
       -usk          USA: Kansas City.
       -usn          USA: New York."
      exit 1 ;;
esac
}

repositorio


