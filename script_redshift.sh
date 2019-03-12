#!/usr/bin/env bash

t1=sleep 1

echo "script para instalação do redshift"

sudo emerge x11-misc/redshift

$t1

sed -i '1i\redshift -c ~/.config/redshift/redshift.conf &\' ~/.xinitrc

echo "script finalizado"
