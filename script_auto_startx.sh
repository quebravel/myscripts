#!/bin/bash

rm -r ~/.log

sleep 1
mkdir -p ~/.log

sleep 1
touch ~/.log/xsession-errors

sleep 1
cp /etc/zsh/zprofile ~/.zprofile

sleep 1
echo '# Auto startx depending on the tty
if [[ -z $DISPLAY ]] && (( $EUID != 0 )) {
    [[ ${TTY/tty} != $TTY ]] && (( ${TTY:8:1} <= 3 )) &&
        startx 1>~/.log/xsession-errors 2>&1 &
}
' >> ~/.zprofile

sleep 1

echo '>>> auto startx configurado'
