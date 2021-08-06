#!/bin/bash

sudo apt update -y && sudo apt upgrade -y
sudo apt install -y \
  apt-transport-https \
  brave-browser \
  build-essential \
  code \
  curl \
  flameshot \
  git \
  google-chrome-stable \
  kubuntu-desktop \
  linux-headers-generic \
  net-tools \
  nodejs \
  software-properties-common \
  python3-pip \
  ubuntu-restricted-extras \
  neovim \
  terminator \
  zsh

snap install spotify

curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
curl -fsSL https://get.docker.com/ | sh

sudo usermod -aG docker $(whoami)

sudo curl -L https://github.com/docker/compose/releases/download/1.20.1/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

curl -sS https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb | sudo dpkg -i -

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
mv zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/

chsh robson -s /bin/zsh
cp zshrc ~/.zshrc
