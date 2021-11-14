#!/bin/bash
git config --global user.name "Taiga"
git config --global user.email "qqtaiga@gmail.com"

# Install packages
source ./script/install-arch-packages.sh
source ./script/install-cargo-packages.sh
source ./script/install-npm-packages.sh

# Configure docker
groupadd docker
usermod -aG docker ${USER}
systemctl enable docker.service
systemctl enable containerd.service

# Change zsh as default shell
chsh -s $(which zsh)

# Use stow to create symlink for config files
cd config
for d in *; do
    stow -d $(pwd) -t ${HOME} -R ${d}
done
cd ..
echo "Added all dotfiles"

# Ask for reboot
echo "Some settings need to restart to take effect, do you want to restart now?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) reboot; break;;
        No ) exit;;
    esac
done
