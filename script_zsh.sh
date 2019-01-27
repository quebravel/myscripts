echo "fontes finalizada"

echo "usuario instalar/configurar zsh"
emerge -auDN @world
emerge -q app-shells/{zsh,zsh-completions,gentoo-zsh-completions}
sleep 0.5

echo "ESCREVA O NOME DO USUÁRIO"

read opcao

chsh -s /bin/zsh $opcao
sleep 0.5
chsh -s /bin/zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sleep 0.5
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc

echo "zsh finalizado"
