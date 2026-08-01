#!/usr/bin/env bash

set -e

nix-shell -p xdg-user-dirs --run 'xdg-user-dirs-update'

nix-shell -p git --run 'git clone https://github.com/moktavizen/dotfiles ~/.dotfiles'
cd ~/.dotfiles

nix-shell -p dotter --run 'dotter deploy -v'

sudo ln -sf ~/.dotfiles/configuration.nix /etc/nixos/configuration.nix

sudo nixos-rebuild switch
