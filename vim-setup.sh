# /bin/bash

echo "Starting vim setup"
NVIM_HOME=~/.config/nvim

mkdir -p $NVIM_HOME
echo "Copy vimrc to home"
cp vimrc ~/.vimrc
ln -s ~/.vimrc $NVIM_HOME/init.vim
ln -s ~/.vim/autoload $NVIM_HOME/autoload
cp coc-settings.json $NVIM_HOME

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
curl -fLo "PowerlineSymbols" https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
curl -fLo "10-powerline-symbols" https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

vim +PluginInstall +qall
