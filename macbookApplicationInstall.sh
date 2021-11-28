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

# Install Brew
echo "                                  Install Brew                                  "
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "Installing Brew .................................................... Complete.  "

# Brew installs
echo " "
echo "                                  Brew Installs                                 "
brewinstall 'Docker .....................................................' docker
brewinstall 'Node .......................................................' node
brewinstall 'Pipenv .....................................................' pipenv
brewinstall 'Python 3.8 .................................................' python@3.8
brewinstall 'Vim ........................................................' vim

# Cask installs
echo " "
echo "                                  Brew Cask Installs                                 "
caskinstall 'Affinity Designer ..........................................' affinity-designer
caskinstall 'Affinity Publisher .........................................' affinity-publisher
caskinstall 'Affinity Photo .............................................' affinity-photo
caskinstall 'Amethyst ...................................................' amethyst
caskinstall 'Google Chrome ..............................................' google-chrome
caskinstall 'Intellij Idea CE ...........................................' intellij-idea-ce
caskinstall 'Open JDK 11 ................................................' adoptopenjdk@11
caskinstall 'Postman ....................................................' postman
caskinstall 'Pycharm CE .................................................' pycharm-ce
caskinstall 'Signal .....................................................' signal
caskinstall 'Visual Studio Code .........................................' visual-studio-code

# Script end
echo " "
echo "##################### Mac OS Application Installer Complete ####################"
