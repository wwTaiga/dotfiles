#!/bin/bash
cd config
for d in *; do
    stow -d $(pwd) -t ${HOME} -D ${d}
done
cd ..

echo "Removed all dotfiles."
