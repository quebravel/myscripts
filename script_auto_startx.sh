#!/bin/bash

t1=sleep 0.5

rm -r ~/.log

$t1

mkdir -p ~/.log

$t1

touch ~/.log/xsession-errors

$t1

cp /etc/zsh/zprofile ~/.zprofile

$t1

echo '# Auto startx depending on the tty
if [[ -z $DISPLAY ]] && (( $EUID != 0 )) {
    [[ ${TTY/tty} != $TTY ]] && (( ${TTY:8:1} <= 3 )) &&
        xinit 1>~/.log/xsession-errors 2>&1 &
}
' >> ~/.zprofile

$t1

echo -e "\033[41;1;37m>>>\033[0m auto startx configurado"
