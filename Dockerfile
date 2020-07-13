FROM ubuntu

ENV INITRD No
ENV LANG en_US.UTF-8
ENV GOVERSION 1.6.2
ENV GOROOT /opt/go
ENV GOPATH /root/.go

WORKDIR /root

RUN apt update -y && apt install -y \
  build-essential \
  curl \
  git \
  vim \
  zsh

COPY vim-setup.sh coc-package.json ./

RUN curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
  && sh -c "echo 'deb https://deb.nodesource.com/node_12.x focal main' > \
  /etc/apt/sources.list.d/nodesource.list" \
  && apt update -y && apt install -y nodejs \
  && curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh \
  && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  && mv zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins \
  && apt clean

COPY zshrc .zshrc
COPY vimrc .vimrc
RUN bash vim-setup.sh

