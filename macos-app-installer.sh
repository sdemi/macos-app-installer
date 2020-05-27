#!/bin/bash

#
# Primary basis of this script has been copied from Deian Isac
# ref: https://medium.com/@deianisac/how-to-quickly-set-up-a-mac-b9f89aed0dc
#

echo Install Mac App Store apps first: Greenshot

echo Install other apps manually: Microsoft Office, Citrix Workspace, KeepSolid VPN Unlimited

# Either use mas-cli (https://github.com/argon/mas) or install manually; apps I need: Greenshot
read -p "Press any key to continue… " -n1 -s
echo '\n'

# Install Xcode
xcode-select --install

# Check that Homebrew is installed and install if not
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /tmp/homebrew-install.log
fi

# Update any existing homebrew recipes
brew update

# Upgrade any already installed formulae
brew upgrade --all

# Install my brew packages
brew install composer
brew install zsh

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install cask
brew tap phinze/homebrew-cask

# Install desired cask packages
brew cask install cakebrew
brew cask install google-chrome
brew cask install google-backup-and-sync
brew cask install folx
brew cask install vlc
brew cask install virtualbox
brew cask install appcleaner
brew cask install sublime-text
brew cask install keepassxc
brew cask install vagrant
brew cask install iterm2
brew cask install microsoft-teams
brew cask install visual-studio-code
brew cask install webex-meetings

# Remove brew cruft
brew cleanup

# Remove cask cruft
brew cask cleanup

# Install Ansible
# ref: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#from-pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py --user
pip install --user ansible
rm get-pip.py
