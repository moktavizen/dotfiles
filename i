#!/usr/bin/env nix-shell
#!nix-shell -i bash -p xdg-user-dirs git dotter

xdg-user-dirs-update

git clone https://github.com/moktavizen/dotfiles ~/.dotfiles
cd ~/.dotfiles
dotter deploy

sudo ln -sf ~/.dotfiles/configuration.nix /etc/nixos/configuration.nix
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nixos-rebuild switch --upgrade

reboot
