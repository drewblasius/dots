#!/bin/bash

[[ $USER == root ]] && exit;

# put the dotfiles in the right place
echo 'adding .vimrc'
cp -f ./.vimrc ~/.vimrc
echo 'adding .gitconfig'
cp -f ./.gitconfig ~/.gitconfig
echo 'adding .tmux.conf'
cp -f ./.tmux.conf ~/.tmux.conf
