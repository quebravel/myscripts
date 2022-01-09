#!/bin/bash
#
# Ref: https://www.reddit.com/r/voidlinux/comments/6xor9j/automatically_find_fastest_update_mirror_and_use/
# Ref: https://edpsblog.wordpress.com/2019/08/24/how-to-escolhendo-espelhos-mais-rapidos-no-void-linux/
#
# Require: xbps-install -S geoip

sudo mkdir -p /etc/xbps.d

sudo cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/

declare -a arr=("alpha.de.repo.voidlinux.org" \
        "mirror.clarkson.edu" \
        "alpha.us.repo.voidlinux.org" \
        "mirrors.servercentral.com" \
        "void.webconverger.org"
        "void.cijber.net" \
        "mirror.erickochen.nl" \
        "ftp.dk.xemacs.org" \
        "quantum-mirror.hu")
 
fping=10000
frepo=""
 
for repo in "${arr[@]}"
    do
geo=`geoiplookup $repo | head -1 | sed 's/^.*: //'`
    echo ""
    echo "Testing ping for $repo ($geo)"
ping=`ping -c 4 $repo | tail -1| awk '{print $4}' | cut -d '/' -f 2 | bc -l`
    echo "$repo Average ping: $ping"
    if (( $(bc <<< "$ping<$fping") ))
    then
    frepo=$repo
    fping=$ping
    fi
done
 
geo=`geoiplookup $frepo | head -1 | sed 's/^.*: //'`
    echo ""
    echo "Recommended repo is: $frepo ($geo)"
echo "Ping: $fping"


sudo sed -i "s|https://alpha.de.repo.voidlinux.org|https://$frepo|g" /etc/xbps.d/*-repository-*.conf

sudo xbps-install -S && sudo xbps-query -L

