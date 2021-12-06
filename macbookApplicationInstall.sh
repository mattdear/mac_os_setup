#!/bin/zsh

# Ensure user is running with superuser privileges
[ $(id -u) != 0 ] && echo 'This script must be run with superuser privileges.' && exit 0

# Sets variables
user=$SUDO_USER
[ -z $user ] && read -p 'What user is running this script? ' user
home=/home/$user

# Basic install function
basicinstall(){
  echo "Installing $1 \c"
  $2 1>/dev/null 2>/tmp/stderr && echo 'Complete' || echo -e 'Error: \c' && cat /tmp/stderr | egrep '^E: ' | sed 's/^E: //'
}

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

# Prompt user to continue function
promptcontinue(){
  echo "$1\c"
  stty -echo
  userinput='this variable needs to contain something otherwise the following loop will immediately pass'
  while [ "$userinput" ]; do
    read userinput
  done
  stty echo
  echo 'Complete'
}

# Script start
clear
echo "##################### Mac OS Application Installer Started #####################"

# Basic Installs
ohMyZsh='sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
homebrew='/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
echo " "
echo "                                  Initial Setup                                 "
basicinstall 'Oh My ZSH ..................................................' ohMyZsh
basicinstall 'Homebrew ...................................................' homebrew

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
caskinstall 'Signal .....................................................' spotify
caskinstall 'Visual Studio Code .........................................' visual-studio-code

# Manual installs
echo " "
echo "                                  Manual Installs                                    "
echo "Visual Studio Code Extensions ------------------------------------------------------ "
promptcontinue "Docker ................................................................. \c"
promptcontinue "Extension Pack for Java ................................................ \c"
promptcontinue "Git Blame .............................................................. \c"
promptcontinue "Git Graph .............................................................. \c"
promptcontinue "GitHub Theme ........................................................... \c"
promptcontinue "Markdown PDF ........................................................... \c"
promptcontinue "Python Extension Pack .................................................. \c"
promptcontinue "Spring Boot Extension Pack ............................................. \c"
promptcontinue "VSCode-Spotify ......................................................... \c"
echo " "
echo "IntelliJ Idea Plugins -------------------------------------------------------------- "
promptcontinue "IdeaVim ................................................................ \c"
promptcontinue "Xcode-Dark Theme ....................................................... \c"

# Script end
echo " "
echo "##################### Mac OS Application Installer Complete ####################"
