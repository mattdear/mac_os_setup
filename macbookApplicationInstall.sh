#!/bin/zsh

# Custom apt install function
brewinstall(){
  echo "Installing $1 \c"
  brew install $2 1>/dev/null 2>/tmp/stderr && echo 'Complete' || echo -e 'Error: \c' && cat /tmp/stderr | egrep '^E: ' | sed 's/^E: //'
}

# Script start
clear
echo "#################### Macbook Application Installer Started #####################"

# Install Brew
-c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Brew installs
echo " "
echo "                                  Brew installs                                 "
brewinstall 'Vim ........................................................' vim
brewinstall 'Pipenv .....................................................' pipenv
brewinstall 'Python 3.8 .................................................' python@3.8
brewinstall 'Docker .....................................................' docker

# Cask installs
echo " "
echo "                                  Cask installs                                 "
caskinstall 'Intellij Idea CE ...........................................' --cask intellij-idea-ce
caskinstall 'Pycharm CE .................................................' --cask pycharm-ce
caskinstall 'Visual Studio Code .........................................' --cask visual-studio-code
caskinstall 'Open JDK 11 ................................................' --cask adoptopenjdk@11
caskinstall 'Spotify ....................................................' --cask spotify
caskinstall 'Signal .....................................................' --cask signal
caskinstall 'Google Chrome ..............................................' --cask google-chrome
caskinstall 'Draw IO ....................................................' --cask drawio
caskinstall 'Discord ....................................................' --cask discord

# Script end
echo " "
echo "#################### Macbook Application Installer Complete ####################"