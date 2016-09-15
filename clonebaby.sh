#!/bin/sh

# Huge thanks to Matthew Mueller and his blogpost at http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac

# Check for Homebrew
if test ! $(which brew); then
  echo "Installing homebrew.."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew
brew update

echo "Installing packages.."

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4 (Hello Shellshock)
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

# Install other useful binaries
binaries=(
  python
  sshfs
  tree
  ack
  git
  hub
  node
  maven
)

# Install the binaries
brew install ${binaries[@]}

# Install Cask
brew install caskroom/cask/brew-cask

# Remove outdated versions from the cellar
brew cleanup

apps=(
  alfred
  dropbox
  google-chrome
  firefox
  spotify
  java
  sublime
  atom
  vlc
  transmission
  slack
  qlcolorcode
  quicklook-json
  qlmarkdown
  qlstephen
  intellij-idea
  iterm2
  docker-toolbox
)

# Adding beta versions
brew tap caskroom/versions

echo "Installing apps.."
brew cask install ${apps[@]}

echo "Setting up zsh"
curl -L http://install.ohmyz.sh | sh
echo export PATH='/usr/local/bin:$(brew --prefix coreutils)/libexec/gnubin:$PATH' >> ~/.zshrc # <- TODO: Make idempotent

#TODO: Dotfiles
echo "Setting up VIM"
cp -R dotfiles/.vim* ~

echo "Settings.."
defaults write com.apple.systemsound 'com.apple.sound.uiaudio.enabled' -int 0
defaults write com.apple.finder AppleShowAllFiles YES
defaults write -g InitialKeyRepeat -int 20
defaults write -g KeyRepeat -int 1
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

#TODO: Terminal colors
#TODO: Clean up zsh aliases

exit 0

