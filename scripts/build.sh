#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
dnf update -y
grep -v '^#' ./packages.list | xargs dnf install -y


# install go
curl https://go.dev/dl/go1.24.0.linux-amd64.tar.gz -O /tmp/go.tar.gz
tar -C /usr/local -xzf /tmp/go.tar.gz
fish_add_path -g /usr/local/go/bin

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# use brew to install kubernetes and openshift tools
brew install kubectl
brew install kind
brew install openshift-cli
