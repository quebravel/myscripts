#/bin/bash

usage(){
    echo "user:
    -n              Nome no Instagram.
    -h              Chama essa ajuda."
}

while getopts ":n:h" o; do
    case "${o}" in
        n) nikename=$OPTARG
            ;;
        h|?) usage
            ;;
    esac
done

wget -q https://www.instagram.com/$nikename/ -P ~/

#<span class="g47SY " title="103">103</span>
# "edge_followed_by":{"count":
# "edge_follow":{"count":

seguindo=`grep -oE '.{0,1}edge_follow".{0,14}' ~/index.html | sed 's/"edge_follow":{"count"://g' | sed 's/}//g'`

seguidores=`grep -oE '.{0,1}edge_followed_by".{0,14}' ~/index.html | sed 's/"edge_followed_by":{"count"://g' | sed 's/}//g'`

echo "Seguindo: $seguindo", Seguidores: $seguidores.

rm ~/index.html
