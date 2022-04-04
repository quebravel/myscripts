#!/usr/bin/env bash

t1=sleep 1

sudo mkdir -p /etc/portage/package.use

sudo touch /etc/portage/package.use/redshift

$t1

sudo echo '>=x11-misc/redshift-1.12 -gtk' >> /etc/portage/package.use/redshift

echo "script para instalação do redshift"

sudo emerge x11-misc/redshift

$t1

sed -i '1i\redshift -c ~/.config/redshift/redshift.conf &\' ~/.xinitrc

echo "script finalizado"
