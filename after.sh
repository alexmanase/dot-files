#!/bin/sh

# Homestead setup after vagrant up command

if [ ! -f /usr/local/extra_homestead_software_installed ]; then
    # Set timezone
    sudo timedatectl set-timezone Europe/Bucharest

    # Setup Github
    sudo -u vagrant -H git config --global user.name 'Alex Manase'
    sudo -u vagrant -H git config --global user.email malexandru699@gmail.com
    git config --global credential.helper cache
    git config --global credential.helper 'cache --timeout=604800'

    # Setup ZSH plugins
    git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"/plugins/zsh-syntax-highlighting
    sed -i "s/plugins=(git)/plugins=(zsh-autosuggestions zsh-syntax-highlighting)/" /home/vagrant/.zshrc

    # Install httpie
    sudo apt-get install httpie

    sudo touch /usr/local/extra_homestead_software_installed
fi

