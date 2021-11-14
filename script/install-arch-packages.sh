#!/bin/bash
if ! [ -x "$(command -v paru)" ]; then
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd ..
    rm -rf paru
fi

packages=(
    curl
    fzf
    gcc
    make
    git
    go
    google-chrome
    kitty
    neovim
    lazygit
    ripgrep
    stow
    tmux
    zsh

    #font
    otf-nerd-fonts-fira-code

    # C# development
    dotnet-runtime
    dotnet-sdk

    rust

    # web development
    npm
)

paru -S ${packages[@]} --needed
