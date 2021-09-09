#!/bin/env bash

sudo xbps-install -Sy nodm

echo -e 'NODM_USER="jonatas"\nNODM_XSESSION="/home/jonatas/.xinitrc"' | sudo tee /etc/sv/nodm/conf

sudo ln -s /etc/sv/nodm /var/service
