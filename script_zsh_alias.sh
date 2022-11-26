#!/bin/env bash


# zsh(){
#
# sudo xbps-install -Sy zsh zsh-{autosuggestions,completions}
#
# echo "-> -> -> -> -> -> configurando zsh para padrao <- <- <- <- <- <-"
#
# nome=`users`
#
# chsh --shell /bin/zsh $nome
#
# sudo chsh --shell /bin/zsh root
#
# echo "oh-my-zsh"
#
# sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#
# }


echo "arquivo alias"

wget https://raw.githubusercontent.com/quebravel/dotfiles-conf/master/.aliaszshrc -P ~/

echo "arquivo de plugins"

wget https://raw.githubusercontent.com/quebravel/dotfiles-conf/master/.vizshrc -P ~/



sleep 1



echo -e "\nexport\tEDITOR='nvim'\nexport\tTERMINAL='alacritty'\nexport\tBROWSER='qutebrowser'\nexport\tREADER='zathura'\nexport\tSHELL='zsh'\nexport\tXDG_CURRENT_DESKTOP='bspwm'\n\n[[ ! -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] || source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh\n[[ ! -f ~/.aliaszshrc ]] || source ~/.aliaszshrc\n[[ ! -f ~/.vizshrc ]] || source ~/.vizshrc\n\n# autopair zsh\nif [[ ! -d ~/.zsh-autopair ]]; then\n\tgit clone https://github.com/hlissner/zsh-autopair ~/.zsh-autopair\nfi\n\nsource ~/.zsh-autopair/autopair.zsh\nautopair-init" >> $HOME/.zshrc

# alias_z
