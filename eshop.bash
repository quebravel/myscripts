#!/bin/bash
#

procura="https://eshop-prices.com/games?currency=BRL&q="
awk '
 function tratamento (tag) {
  gsub(/<[^>]*>/, "", tag)
  return tag
 }

  /^.*R\$[0-9]|FREE.*$|^.*<h5>.*$/ {
  if ( $0 ~ "<h5>" ) {
   dois = tratamento($0)
  } else {
  print tratamento($0), dois
 }
}
' <<< "$(wget $procura$1 -q -O -)"


#' <<< "$(wget https://eshop-prices.com/games -q -O -)"

# "$(wget https://eshop-prices.com/prices?currency=BRL -q -O -)"
