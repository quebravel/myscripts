#!/bin/bash

sudo emerge net-libs/nodejs

sudo npm install -g live-server
echo 'live-server instalado \n>>> inicir -> live-server <- na pasta do arquivo html para começar a usa-lo.'

sudo npm install -g browser-sync
echo 'browser-sync instalado \n>>>>= use o comando -> browser-sync start -f ~/pastaprojeto --server <-'
