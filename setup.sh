#!/bin/bash

set -e
INSTALL_DIR=$HOME
CONDA_DIR=${INSTALL_DIR}/.miniconda

# Python
if [ ! -d ${CONDA_DIR} ]; then
  if [ ! -f ./Miniconda3-latest-Linux-x86_64.sh ]; then
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
  fi
  bash Miniconda3-latest-Linux-x86_64.sh -b -p ${CONDA_DIR}
fi

export PATH=${CONDA_DIR}/bin:$PATH

echo "Adding vim, tmux"
conda env update --quiet -f environment.yml -n root
#conda install -y gcc ncurses && \
#  conda install -c conda-forge curl openssl vim tmux=2.7 flake8 git -y && \
#  conda install -c ostrokach-forge ripgrep -y && \
#  conda install -c r r-base r-essentials r-lintr -y
#  conda install -c anaconda flake8 openssl -y #&& \

# conda  --file environment.yml
# conda env update --file environment.yml && source activate xoxo

# Tmux plugins
if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone --depth 1 --branch "v3.0.0" https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

mkdir -p ./backups

###
# .tmux.conf
if [ -f $HOME/.tmux.conf ]; then
  cp $HOME/.tmux.conf ./backups/
fi
cp ./.tmux.conf ~/.tmux.conf

# Need to run this to manually install the plugins, too
tmux start-server && \
  tmux new-session -t install-plugins -d && \
  ~/.tmux/plugins/tpm/bin/install_plugins && \
  tmux kill-session -t install-plugins

echo "Adding plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

###
# .vimrc
if [ -f $HOME/.vimrc ]; then
  cp $HOME/.vimrc ./backups/
fi
cp ./.vimrc ~/.vimrc

# Get vim plugins
echo "Installing vim plugins"
vim +PlugInstall +qall

###
# Bashrc
if [ -f $HOME/.bashrc ]; then
  cp $HOME/.bashrc ./backups/
fi

echo "PATH=${CONDA_DIR}/bin:\$PATH" >> ~/.bashrc
${CONDA_DIR}/bin/python ./util/safe_edit_bashrc.py ~/.bashrc 

###
# Gitconfig
if [ -f $HOME/.gitconfig ]; then
  cp $HOME/.gitconfig ./backups/
fi
cp ./.gitconfig ~/.gitconfig


### 
# Auto-complete
if [ -f $HOME/.bash_completion ]; then
  cp $HOME/.bash_completion ./backups/
fi
cat completion/* > $HOME/.bash_completion

