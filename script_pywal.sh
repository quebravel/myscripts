#!/bin/bash

#variavel valor
t1='sleep 0.5'
opcao=$1

escolha(){
echo $opcao
case $opcao in
   "-g") gentoo ;;
   "--gentoo") gentoo ;;
   "-v") void ;;
   "--void") void ;;
   *) echo "Opção inválida! Use uma das seguintes opcoes:
       -g,--gentoo                  Usa script para gentoo
       -v,--void                    Usa script para void"
      exit 1 ;;
esac
}

gentoo(){

git clone https://github.com/dylanaraps/pywal

$t1

cd pywal

$t1

emerge pip

$t1

pip3 install --user .

$t1

echo -e "\033[41;1;37m>>>\033[0m add configuração ao .zshrc"

$t1

echo 'export PATH="${PATH}:${HOME}/.local/bin/"}' >> ~/.zshrc

$t1

#echo 'cat ~/.cache/wal/sequences' >> ~/.zshrc
echo 'wal-tile() {
     wal -n -i "$@"
     feh --bg-tile "$(< "${HOME}/.cache/wal/wal")"
}' >> ~/.zshrc

$t1

echo -e "\033[41;1;37m>>>\033[0m add configuração ao bspwmrc"

$t1

echo 'feh --bg-scale "$(< "${HOME}/.cache/wal/wal")"' >> ~/.config/bspwm/bspwmrc

$t1

echo -e "\033[41;1;37m>>>\033[0m agora UTILIZE wal -i ~caminho do wallpapers de sua escolha"

$t1

echo -e "\033[41;1;37m>>>\033[0m instalacao e configuracao do pywal completo"

}

void(){

sudo xbps-install -S pywal

sleep 1

echo "cat ~/.cache/wal/sequences\nsource ~/.cache/wal/colors-tty.sh\n. "${HOME}/.cache/wal/colors.sh"" >> $HOME/.zshrc

sleep 1

echo "wal-tile() {\n    wal -n -i "$@"\n    feh --bg-tile "$(< "${HOME}/.cache/wal/wal")"\n}" >> $HOME/.zshrc

wal -R

echo '>>> PYWAL INSTALADO E CONFIGURADO!!!!'

echo 'EXECUTE para iniciar o pywal >>>> wal -i <wallpaper> -n'

echo 'Adcione <wal -R> em .xinitrc'

}

escolha
