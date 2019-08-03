#!/bin/bash

t1="sleep 1"


if ! rm -f ~/.zprofile
then
    echo -e ">>> .zprofile ok..."
fi

if ! rm -fr ~/.log
then
    echo -e ">>> .log ok..."
fi

$t1

mkdir -p ~/.log

$t1

touch ~/.log/xsession-errors

$t1


# if ! cp -f /etc/zsh/zprofile ~/.zprofile
# then
    # echo -e ">>> nao existe zprofile, vou cria-lo..."
# fi

# $t1

echo '# Auto startx depending on the tty
if [[ -z $DISPLAY ]] && (( $EUID != 0 )) {
    [[ ${TTY/tty} != $TTY ]] && (( ${TTY:8:1} <= 3 )) &&
        xinit 1>~/.log/xsession-errors 2>&1 &
}
' >> ~/.zprofile

$t1

echo -e "\033[41;1;37m>>>\033[0m auto startx configurado"
