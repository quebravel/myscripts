#!/bin/bash

idKeybord=`xinput list | grep "AT Translated Set 2 keyboard" | cut -c 49-50`
idKeyFloat=`xinput list | grep "AT Translated Set 2 keyboard" | cut -c 53-54`

switch=`xinput list | grep "AT Translated Set 2 keyboard" | grep -e "id=" | cut -c53-60`
#switchA=`xinput list | grep "AT Translated Set 2 keyboard" | grep -e "id=" | cut -c57-61`

masterNumber=`xinput list | grep "Asus WMI hotkeys" | cut -c 74`


if [ "$switch" == "floating" ]; then 
	echo 'Teclado ativando'
	xinput reattach $idKeybord $masterNumber
else
	echo 'Teclado desativado'
	xinput float $idKeyFloat
fi

#read switch
#case "$switch" in
#    "floating")
#        echo "Ativando teclado do notebook.)"
#	xinput reattach $idKeybord $masterNumber
#    ;;
#    "23	[slav")
#        echo "Desativando teclado do notebook."
#	xinput float $idKeybord
#    ;;
#    *)
#        echo "Opção inválida"
#    ;;
#esac
