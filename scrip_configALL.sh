#!/bin/bash

# quando o pulseaudio nao esta iniciando, desabilitar economia de energia.
sudo echo "options snd-hda-intel power_save=0 power_save_controller=N" > /etc/modprobe.d/alsa-base.conf

# comfigurar tema do mouse.
mkdir -p ~/.icons/default
echo -e "[icon theme]\nInherits=Vanilla-DMZ-AA" > ~/.icons/default/index.theme

mkdir -p ~/.config/gtk-3.0
echo -e "[Settings]\ngtk-cursor-theme-name=Vanilla-DMZ-AA" > ~/.config/gtk-3.0/settings.ini

# adicionar ao runit.
sudo ln -s /etc/sv/dbus /var/service/
sudo ln -s /etc/sv/pulseaudio /var/service/
sudo ln -s /etc/sv/mpd /var/service/
sudo ln -s /etc/sv/vnstatd /var/service/
sudo ln -s /etc/sv/sshd /var/service/

# tema gruvbox
mkdir ~/.themes
mkdir ~/.icons

git clone https://github.com/jmattheis/gruvbox-dark-gtk ~/.themes/gruvbox-dark-gtk

git clone https://github.com/jmattheis/gruvbox-dark-icons-gtk ~/.icons/gruvbox-dark-icons-gtk

# sudo nvim /etc/sudoers
# jonatas ALL = NOPASSWD: /sbin/shutdown
