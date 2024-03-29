#/bin/env bash

sudo mkdir -p /etc/udev/rules.d/

sudo touch /etc/udev/rules.d/00-local.rules

echo " # Set USB headset as default sound card when plugged in
KERNEL=="pcmC[D0-9cp]*", ACTION=="add", PROGRAM="/bin/sh -c 'K=%k; K=$${K#pcmC}; K=$${K%%D*}; echo defaults.ctl.card $$K > /etc/asound.conf; echo defaults.pcm.card $$K >>/etc/asound.conf'"

 # Restore default sound card when USB headset unplugged
KERNEL=="pcmC[D0-9cp]*", ACTION=="remove", PROGRAM="/bin/sh -c 'echo defaults.ctl.card 0 > /etc/asound.conf; echo defaults.pcm.card 0 >>/etc/asound.conf'" " | sudo tee /etc/udev/rules.d/00-local.rules
