#!/bin/sh

[[ $USER == root ]] && exit;

# put the dotfiles in the right place
cp -f ./.vimrc ~/.vimrc
cp -f ./.gitconfig ~/.gitconfig
