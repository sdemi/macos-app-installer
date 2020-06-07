#!/bin/bash

#
# Primary basis of this script has been copied from Deian Isac
# ref: https://medium.com/@deianisac/how-to-quickly-set-up-a-mac-b9f89aed0dc
#

# Either use mas-cli (https://github.com/argon/mas) or install manually
echo Install Mac App Store apps first: Greenshot

echo Install other apps manually: Microsoft Office, Citrix Workspace, KeepSolid VPN Unlimited

read -p "Press any key to continue… " -n1 -s
echo '\n'

# Install Xcode
xcode-select --install
read -p "Press any key when the installation has completed." -n1 -s
echo '\n'

# Check that Homebrew is installed and install if not
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Update any existing homebrew recipes
brew update

# Upgrade any already installed formulae
brew upgrade

# Install my brew packages
brew install composer
brew install zsh

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

# Install Ansible
# ref: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#from-pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py --user
#TODO: add pip to $PATH, line below doesnt run
pip install --user ansible
rm get-pip.py

# Update System Prefernces - Disable Natural Scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Update System Prefernces - Remove All Default Icons from the Dock
defaults delete com.apple.dock persistent-apps
defaults delete com.apple.dock persistent-others
killall Dock

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
