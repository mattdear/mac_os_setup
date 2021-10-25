#!/bin/zsh

# Custom brew install function
brewinstall(){
  echo "Installing $1 \c"
  brew install $2 1>/dev/null 2>/tmp/stderr && echo 'Complete' || echo -e 'Error: \c' && cat /tmp/stderr | egrep '^E: ' | sed 's/^E: //'
}

# Custom cask install function
caskinstall(){
  echo "Installing $1 \c"
  brew install --cask $2 1>/dev/null 2>/tmp/stderr && echo 'Complete' || echo -e 'Error: \c' && cat /tmp/stderr | egrep '^E: ' | sed 's/^E: //'
}

# Script start
clear
echo "##################### Mac OS Application Installer Started #####################"

# Brew installs
echo " "
echo "                                  Brew Installs                                 "
brewinstall 'Vim ........................................................' vim
brewinstall 'Pipenv .....................................................' pipenv
brewinstall 'Python 3.8 .................................................' python@3.8
brewinstall 'Docker .....................................................' docker

# Cask installs
echo " "
echo "                                  Cask Installs                                 "
caskinstall 'Intellij Idea CE ...........................................' intellij-idea-ce
caskinstall 'Pycharm CE .................................................' pycharm-ce
caskinstall 'Visual Studio Code .........................................' visual-studio-code
caskinstall 'Open JDK 11 ................................................' adoptopenjdk@11
caskinstall 'Spotify ....................................................' spotify
caskinstall 'Signal .....................................................' signal
caskinstall 'Google Chrome ..............................................' google-chrome
caskinstall 'Discord ....................................................' discord

# Script end
echo " "
echo "##################### Mac OS Application Installer Complete ####################"