#!/bin/bash

echo '# xbsp
alias xi="sudo xbps-install -S"
alias xr="sudo xbps-remove -R"
alias xo="sudo xbps-remove -Oo"
alias xq="xbps-query -Rs"

# default programs terminal
export EDITOR="vim"
export TERMINAL="urxvt"
export BROWSER="firefox"
export READER="zathura"
alias n="nvim"
alias v="vim"
alias cat="cat -n"

# power | /etc/sudoers | %<usuário> <hostname> =NOPASSWD: /usr/bin/shutdown
alias shutdown -h now="sudo shutdown -h now"
alias shutdown -r now="sudo shutdown -r now"' >> $HOME/.zshrc
