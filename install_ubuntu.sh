#!/bin/sh

SCRIPT_PATH=`pwd`
echo $(SCRIPT_PATH)

# tmp folder
cd ~
mkdir tmp
cd ~/tmp

# fd
wget https://github.com/sharkdp/fd/releases/download/v7.2.0/fd-musl_7.2.0_amd64.deb
sudo dpkg -i fd-musl_7.2.0_amd64.deb

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# highlight
sudo apt-get install -y liblua5.3-dev
wget http://www.andre-simon.de/zip/highlight-3.48.tar.bz2
tar xjf highlight-3.48.tar.bz2
cd highlight-3.48
make help
make
make install # (depending on your installation destination, you need to be root)

cd $(SCRIPT_PATH)

# silversearcher and xclip
sudo apt-get install -y silversearcher-ag xclip

# zsh
sudo apt-get install -y zsh
sudo chsh -s /bin/zsh

# oh my zsh
sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ZSHRC="
# prevent ctr-d from exiting the shell
set -o ignoreeof

# fzf config
export FZF_DEFAULT_COMMAND=\"fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f\"
export FZF_DEFAULT_OPTS=\"--height 40% --layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'\"
"
echo $(ZSHRC) >> ~/.zshrc

# tmux
cd ~/tmp
sudo apt-get install -y libevent-dev libncurses-dev
git clone https://github.com/tmux/tmux.git
cd tmux && sh autogen.sh && ./configure && make
sudo make install

# tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# neovim
sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim python-dev python-pip python3-dev python3-pip

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60 && sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60 && sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60 && sudo update-alternatives --config editor

cd $(SCRIPT_PATH)
mkdir ~/.config/nvim
ln -s ./nvim/init.vim ~/.config/nvim/init.vim

# neovim jedi
pip install -y neovim jedi
pip install -y --upgrade autopep8

# vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


