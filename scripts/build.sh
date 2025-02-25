#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
dnf update -y
grep -v '^#' ./packages.list | xargs dnf install -y

# install latest go
LATEST_GO_VERSION="$(curl 'https://go.dev/VERSION?m=text' | head -n 1)"
curl -L "https://go.dev/dl/$LATEST_GO_VERSION.linux-amd64.tar.gz" -o /tmp/go.tar.gz
tar -C /usr/local -xzf /tmp/go.tar.gz

# install vscode
curl -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-rpm-x64" -o /tmp/code.rpm
dnf install -y /tmp/code.rpm

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# use brew to install kubernetes and openshift tools
brew install kubectl
brew install kind
brew install openshift-cli

# install starship
brew install starship
