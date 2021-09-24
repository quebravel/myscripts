#!/bin/bash


zsh(){

sudo xbps-install -Sy zsh zsh-{autosuggestions,completions}

echo "-> -> -> -> -> -> configurando zsh para padrao <- <- <- <- <- <-"

nome=`users`

chsh --shell /bin/zsh $nome

sudo chsh --shell /bin/zsh root

echo "oh-my-zsh"

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

}

echo "arquivo alias"

wget https://raw.githubusercontent.com/quebravel/dotfiles-conf/master/.aliaszshrc -P ~/

echo "arquivo de plugins"

wget https://raw.githubusercontent.com/quebravel/dotfiles-conf/master/.vizshrc -P ~/

}

zsh

sleep 1

zsh

echo -e "add ao .zshrc
\n [[ ! -f ~/.aliaszshrc ]] || source ~/.aliaszshrc
\n [[ ! -f ~/.vizshrc ]] || source ~/.vizshrc

\n # autopair zsh
\n source ~/.zsh-autopair/autopair.zsh
\n autopair-init
"

echo '

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="qutebrowser"
export READER="zathura"
export SHELL="zsh"
export XDG_CURRENT_DESKTOP="bspwm"


[[ ! -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] || source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ ! -f ~/.aliaszshrc ]] || source ~/.aliaszshrc
[[ ! -f ~/.vizshrc ]] || source ~/.vizshrc

# autopair zsh
source ~/.zsh-autopair/autopair.zsh
autopair-init

' >> $HOME/.zshrc

alias_z
