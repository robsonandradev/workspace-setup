# /bin/bash

echo "Starting vim setup"
THIS=$(pwd)
# COC_EXTENSION_HOME=~/.config/coc/extensions
# COC_HOME=~/.vim/pack/coc/start
BUNDLE_HOME=~/.vim/bundle
EDITOR_CONFIG_HOME=~/.vim/pack/local/start
NERD_TREE_HOME=~/.vim/pack/vendor/start
NVIM_HOME=~/.config/nvim
whereWeAre="echo 'Moving to '"

mkdir -p $BUNDLE_HOME
# mkdir -p $COC_EXTENSION_HOME
# mkdir -p $COC_HOME
mkdir -p $EDITOR_CONFIG_HOME
mkdir -p $NERD_TREE_HOME
mkdir -p $NVIM_HOME
echo "Copy vimrc to home"
cp vimrc ~/.vimrc
ln -s ~/.vimrc $NVIM_HOME/init.vim
ln -s ~/.vim/autoload $NVIM_HOME/autoload
cp coc-settings.json $NVIM_HOME

# echo "Setting vim commands"
# mkdir -p $COC_EXTENSION_HOME

# cd $COC_HOME
# $whereWeAre $(pwd)
# echo 'Installing COC'
# curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -

# cd $THIS
# $whereWeAre $(pwd)

# cp ./coc-package.json $COC_EXTENSION_HOME/package.json
# cd $COC_EXTENSION_HOME
# $whereWeAre
# echo "Installing coc extensions"
# npm i

cd $THIS
$whereWeAre $(pwd)
git clone https://github.com/scrooloose/nerdtree.git
echo "Installing nerdtree"
mv nerdtree $NERD_TREE_HOME

echo 'Installing editorconfig'
git clone https://github.com/editorconfig/editorconfig-vim.git
mv editorconfig-vim $EDITOR_CONFIG_HOME

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
curl -fLo "PowerlineSymbols" https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
curl -fLo "10-powerline-symbols" https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

#vim +PluginInstall +qall
