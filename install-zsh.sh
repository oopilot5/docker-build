#!/bin/bash
cd /zsh
#install zsh
apt-get update && apt-get install -y zsh

#install oh-my-zsh
#sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sh install-ohmyzsh.sh

#install plugins
#git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
mv zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins
mv zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins

sed -i 's/plugins=(git)/plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc
#source ~/.zshrc

#cd ~ && ln -s .profile .zprofile
echo "source /etc/profile" >> /etc/zsh/zprofile

rm -rf /zsh