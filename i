#!/usr/bin/env sh

nix-shell -p xdg-user-dirs git dotter --run "
  xdg-user-dirs-update
  git clone https://github.com/moktavizen/dotfiles ~/.dotfiles
  cd ~/.dotfiles && dotter --force
"

sudo ln -sf ~/.dotfiles/configuration.nix /etc/nixos/configuration.nix
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nixos-rebuild switch --upgrade

echo "Installation complete! Reboot to see the result!"