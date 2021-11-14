#!/bin/bash
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
