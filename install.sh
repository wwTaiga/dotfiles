#!/bin/bash
cd config
for d in *; do
    stow -d $(pwd) -t ${HOME} -S ${d}
done
cd ..

echo "Added all dotfiles"
