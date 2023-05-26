#!/usr/bin/env bash

# sh -c "$(wget -O- https://raw.githubusercontent.com/quebravel/myscripts/master/script_dmenu2.sh)"

mkdir -p ~/.srcs
echo ""
echo "[1] installar   [2] remover   [e] sair"
read -r -p "Instalar ou remover dmenu2?... " dm2

case $dm2 in
  [1])

      echo 'DOWNLOAD DMENU2...'

      if [ -d ~/.srcs/dmenu2-1 ]; then
        echo "Detectado pasta para compilar dmenu2, instalando..."
        echo "[ok]"
        tar zxf ~/.srcs/dmenu2-1/dmenu2-0.2.1.tar.gz -C ~/.srcs/dmenu2-1/ && cd ~/.srcs/dmenu2-1/dmenu2-0.2.1/ && sudo make clean install
      else 
        echo "Clonando dmenu2..."
        git -C ~/.srcs clone https://github.com/quebravel/dmenu2-1.git
        echo -e "Instalando dmenu2..."
        tar zxf ~/.srcs/dmenu2-1/dmenu2-0.2.1.tar.gz -C ~/.srcs/dmenu2-1/  && cd ~/.srcs/dmenu2-1/dmenu2-0.2.1/ && sudo make clean install
        echo "[ok]"
      fi

      cd ~/

      echo "dmenu2 instalado [ok]"
      ;;
  [2])
      echo "Removendo dmenu2..."
      cd ~/.srcs/dmenu2-1/dmenu2-0.2.1
      sudo make uninstall
      sudo make clean
      cd ~/
      echo "dmenu2 removido [ok]"
      ;;
  [n])
      exit 1
esac
