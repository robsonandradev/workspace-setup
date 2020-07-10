# /bin/bash

echo "Starting vim setup"
THIS=$(pwd)
COC_EXTENSION_HOME=~/.config/coc/extensions

mkdir -p ~/.vim
mkdir -p $COC_EXTENSION_HOME

echo "Setting vim commands"
echo 'set number'     >> ~/.vimrc
echo 'set ignorecase' >> ~/.vimrc
echo 'autocmd vimenter * NERDTree' >> ~/.vimrc
echo 'map <C-n> :NERDTreeToggle<CR>' >> ~/.vimrc
mkdir -p $COC_EXTENSION_HOME

cp ./coc-package.json $COC_EXTENSION_HOME/package.json
cd $COC_EXTENSION_HOME
echo "Moved to $(pwd)"

echo "Installing coc extensions"
npm i

cd $THIS
git clone https://github.com/scrooloose/nerdtree.git
echo "Installing nerdtree"
mv nerdtree ~/.vim/bundle


