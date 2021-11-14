#!/bin/bash
git config --global user.name "Taiga"
git config --global user.email "qqtaiga@gmail.com"

cd config
for d in *; do
    stow -d $(pwd) -t ${HOME} -R ${d}
done
cd ..

echo "Added all dotfiles"
