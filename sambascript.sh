#!/bin/bash
apt install libcups2 samba samba-common

sleep 1
sed -i s/'server role = standalone server'/'security = user\nserver role = standalone server'/g   /etc/samba/smb.conf

sleep 1
# /etc/init.d/samba restart
service smdb restart

sleep 1
mkdir /home/linux_comp

sleep 1
chgrp users /home/linux_comp

sleep 1
chmod 775 /home/linux_comp

echo -e '[linux_comp]\n comment pasta publica\n path = /home/linux_comp\n valid users = @users\n force group = users\n create mask = 0660\n directory mask = 0771\n writable = yes' >> /etc/samba/smb.conf

sleep 1
sed -i s/'\;\[homes]'/'[homes]'/g /etc/samba/smb.conf

sleep 1
sed -i s/'\;\ .*comment = Home Directories'/'  comment = Home Directories'/ /etc/samba/smb.conf

sleep 1
sed -i s/'\;\ .*browseable = no'/'  browseable = no'/ /etc/samba/smb.conf

sleep 1
sed -i s/'\;\ .*create mask = 0700'/'  create mask = 0700'/ /etc/samba/smb.conf

sleep 1
sed -i s/'\;\ .*directory mask = 0700'/'  directory mask = 0700'/ /etc/samba/smb.conf

sleep 1
sed -i s/'\;\ .*valid users = %S'/'  valid users = %S\n  writable = yes'/ /etc/samba/smb.conf


sleep 1
# /etc/init.d/samba restart
service smdb restart

useradd guest -m -G users
sleep 1
passwd guest

sleep 1
smbpasswd -a guest

sleep 1
ip -s -c -h a

echo "finalizado"



