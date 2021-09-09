#!/bin/env bash

sudo xbps-install -Sy nodm

echo -e 'NODM_USER="${USER}"\nNODM_XSESSION="/home/${USER}/.xinitrc"' | sudo tee /etc/sv/nodm/conf

sudo ln -s /etc/sv/nodm /var/service
