#My Dotfiles

## Prerequisite - Install nix package manager
    curl -L https://nixos.org/nix/install | sh
    nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
    nix-channel --update
    nix-shell '<home-manager>' -A install

## Installation
    git clone git@github.com:qqTaiga/dotfiles.git ~/.config/nixpkgs
    home-manager switch
