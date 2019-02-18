#!/bin/bash

set -e

# Python
if [ ! -f ./Miniconda3-latest-Linux-x86_64.sh ]; then
  wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
fi
bash Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda


# Vim8
if [ ! -d ./vim ]; then
  git clone https://github.com/vim/vim.git
fi
cd ./vim
configure --prefix=$HOME --with-features=huge && \
  make && make install
cd ..

# Bashrc
mkdir -p ./backups
cp $HOME/.bashrc ./backups/

$HOME/miniconda/bin/python ./util/safe_edit_bashrc.py ~/.bashrc 
