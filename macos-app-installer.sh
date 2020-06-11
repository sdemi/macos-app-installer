#!/bin/bash

echo ''
echo ==========================================================
echo ===== MacOS Catalina 10.15.x personal install script =====
echo ==========================================================
echo ''

# Primary basis of this script has been copied from Deian Isac
# ref: https://medium.com/@deianisac/how-to-quickly-set-up-a-mac-b9f89aed0dc

# Either use mas-cli (https://github.com/argon/mas) or install manually
echo Install Mac App Store apps first: Greenshot

echo Install other apps manually: Microsoft Office, Citrix Workspace, KeepSolid VPN Unlimited, iStat Menu

read -p "Press any key to continue… " -n1 -s
echo ''

echo ''
echo ========================================================
echo ===== Skip installation of xcode, install manually =====
echo ========================================================
echo ''

# Install Xcode (install manually if failing)
xcode-select --install
read -p "Press any key when the installation has completed." -n1 -s
echo '\n'

echo ''
echo =======================================
echo ===== Install and update Homebrew =====
echo =======================================
echo ''

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

echo ''
echo =====================================
echo ===== Install Homebrew packages =====
echo =====================================
echo ''

# Install my brew packages
brew install composer
brew install zsh
brew install ansible

# Install cask
brew tap phinze/homebrew-cask

echo ''
echo ================================
echo ===== Install Applications =====
echo ================================
echo ''

# Install desired cask packages
brew cask install cakebrew
brew cask install google-chrome
#brew cask install google-backup-and-sync
brew cask install folx
#brew cask install vlc
brew cask install appcleaner
brew cask install sublime-text
brew cask install iterm2
#brew cask install keepassxc
#brew cask install virtualbox
#brew cask install vagrant
#brew cask install microsoft-teams
#brew cask install webex-meetings
#brew cask install visual-studio-code
brew cask install mucommander
#brew cask install wine-stable

# Remove brew cruft
brew cleanup

echo ''
echo ====================================
echo ===== Update System Prefernces =====
echo ====================================
echo ''

# Update System Prefernces - Disable Natural Scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Update System Prefernces - Remove All Default Icons from the Dock
defaults delete com.apple.dock persistent-apps
defaults delete com.apple.dock persistent-others

killall Dock

# Add installed apps to Dock

# Cakebrew
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Cakebrew.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
# Google Chrome
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Google Chrome.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
# Folx
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Folx.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
# AppCleaner
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/AppCleaner.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
# Sublime Text
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Sublime Text.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
# iTerm
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/iTerm.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
# muCommander
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/muCommander.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"

killall Dock

echo ''
echo =============================
echo ===== Install Oh My Zsh =====
echo =============================
echo ''

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
