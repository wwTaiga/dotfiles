#!/bin/bash
pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru

packages=(
    curl
    fzf
    gcc
    make
    git
    go
    neovim
    lazygit
    ripgrep
    tmux
    zsh

    # C# development
    dotnet-runtime
    dotnet-sdk

    rust

    # web development
    npm
)

echo "paru -S ${packages[@]}"
