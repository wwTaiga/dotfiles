#!/bin/bash
packages=(
    eslint_d
    @fsouza/prettierd

)
npm install -g ${packages[@]}

unset packages
