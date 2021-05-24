export ZSH="/home/robson/.oh-my-zsh"

ZSH_THEME="murilasso"

plugins=(
  aws
  git
  golang
  kubectl
  npm
  pip
  terraform
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

alias kubectl=kubectl
alias terraform=terraform

function ssh_start() {
  eval `ssh-agent -s`
}

function myip() {
  echo "$(curl ipv4.icanhazip.com)"
}
