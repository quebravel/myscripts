#!/usr/bin/env bash

# sh -c "$(wget -O- https://raw.githubusercontent.com/quebravel/myscripts/master/script_dmenu2.sh)"

mkdir -p ~/.srcs
echo ""
echo "[1] instalar   [2] remover   [e] sair"
read -r -p "Instalar ou remover dmenu2?... " dm2

case $dm2 in
  [1])

      echo 'DOWNLOAD DMENU2...'

      if [ -d ~/.srcs/dmenu2 ]; then
        echo "Detectado pasta para compilar dmenu2, instalando..."
        echo "[ok]"
        tar zxf ~/.srcs/dmenu2/dmenu2-0.2.1.tar.gz -C ~/.srcs/dmenu2/ && cd ~/.srcs/dmenu2/dmenu2-0.2.1/ && sudo make clean install
      else 
        echo "Clonando dmenu2..."
        git -C ~/.srcs clone https://github.com/spcmd/dmenu2.git
        echo -e "Instalando dmenu2..."
        tar zxf ~/.srcs/dmenu2/dmenu2-0.2.1.tar.gz -C ~/.srcs/dmenu2/  && cd ~/.srcs/dmenu2/dmenu2-0.2.1/ && sudo make clean install
        echo "[ok]"
      fi

      # echo 'DESCOMPACTANDO PACOTE...'
      # tar zxf ~/.srcs/dmenu2/dmenu2-0.2.1.tar.gz -C ~/.srcs/dmenu2
      #
      # sleep 1
      #
      # cd ~/.srcs/dmenu2/dmenu2-0.2.1/
      #
      # echo 'COMPILANDO DMENU2...'
      #
      # ## instalar
      # sudo make clean install
      #
      # echo -e '\033[01;34mDmenu2 copilado/instalando!\033[0m'
      #
      cd ~/

      #sleep 1

      #echo 'REMOVENDO PASTA'

      #rm -rf ~/Downloads/dmenu2

      ## mudar cores com pywal

      #echo '. "${HOME}/.cache/wal/colors.sh"' | tee >> ~/.zshrc

      #echo '#!/bin/env bash\n\n# Import the colors\n\n. "${HOME}/.cache/wal/colors.sh"\n\n~/Downloads/dmenu2-0.2/dmenu_run -h 17 -y 20 -nb "$color0" -nf "$color4" -sb "$color4" -sf "$color0" -fn "ohsnap" -p "dmenu2"' | tee ~/Downloads/dmenu2-0.2/dmen.sh

      #chmod +x ~/Downloads/dmenu2-0.2/dmen.sh

      # em ~/.config/sxhkd/sxhkdrc muder o 'super + r' para lançar o '~/Downloads/dmenu2-0.2/dmen.sh'

      # echo -e '\033[01;34mPasta do dmenu2 removida!\033[0m'

      echo "dmenu2 instalado [ok]"
      ;;
  [2])
      echo "Removendo dmenu2..."
      cd ~/.srcs/dmenu2/dmenu2-0.2.1
      sudo make uninstall
      sudo make clean
      cd ~/
      echo "dmenu2 removido [ok]"
      ;;
  [n])
      exit 1
esac
