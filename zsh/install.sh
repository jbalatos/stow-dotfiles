#! /usr/bin/sh

sudo pacman -S zsh
sudo pacman -S ttf-nerd-fonts-symbols-mon
sudo pacman -S exa bat fzf zoxide
yay -S oh-my-posh
chsh -s $(which zsh)
