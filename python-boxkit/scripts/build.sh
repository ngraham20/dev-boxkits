#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
dnf update -y
grep -v '^#' ./packages.list | xargs dnf install -y

# install vscode
curl -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-rpm-x64" -o /tmp/code.rpm
dnf install -y /tmp/code.rpm

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# install starship
brew install starship
