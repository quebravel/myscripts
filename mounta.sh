#!/bin/bash

dispositivo=`lsblk | tail -1 | cut -b 7-10`

#variavel valor


t1='sleep 0.5'

opcao=$1

mounta(){
    sudo mount -t auto /dev/$dispositivo /mnt
}

Desmounta(){
    sudo umount -Rf /mnt
}

escolha(){
echo $opcao
case $opcao in
   "-m") mounta ;;
   "--mount") mounta ;;
   "-d") Desmounta ;;
   "--desmount") Desmounta ;;
   *) echo "Opção inválida! Use uma das seguintes opcoes:
       -m,--mount                  Monta dispositivo.
       -d,--desmount               Desmounta dispositivo."
      exit 1 ;;
esac
}

escolha
