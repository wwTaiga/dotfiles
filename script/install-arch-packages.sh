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
    dbeaver
    docker
    docker-compose
    fd
    fzf
    gcc
    make
    git
    go
    google-chrome
    insomnia
    kitty
    neovim
    lazygit
    ripgrep
    stow
    tmux
    xclip
    visual-studio-code-bin
    zsh

    #font
    otf-nerd-fonts-fira-code

    # C# development
    dotnet-host
    dotnet-sdk
    # .net 6
    dotnet-runtime
    aspnet-runtime
    # .net 5
    dotnet-runtime-5.0-bin
    aspnet-runtime-5.0-bin

    rust

    # web development
    npm
)

paru -S ${packages[@]} --needed

unset packages
