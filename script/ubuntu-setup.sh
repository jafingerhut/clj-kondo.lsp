#! /bin/bash

# This script has been tested on the following versions of Linux,
# starting from a fresh minimal install:

#     Ubuntu 18.04 desktop Linux
#     Ubuntu 20.04 desktop Linux

set -x

CURDIR=$PWD

# clj-kondo.lsp currently requires JDK 8
# npm needed for 'npm install' step of clj-kondo.lsp
sudo apt install --yes git curl build-essential openjdk-8-jdk npm

# Install VSCode
sudo snap install code --classic

# Install Leiningen, needed by clj-kondo.lsp build
if [ ! `which lein` ]
then
    echo "Installing Leiningen ..."
    mkdir -p $HOME/bin
    cd $HOME/bin
    curl -O https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
    chmod +x lein
    export PATH="$HOME/bin:$PATH"
    cd $CURDIR
else
    echo "Found Leiningen already installed."
fi

# Using Homebrew is one recommended way to install Babashka
if [ ! `which brew` ]
then
    echo "Installing Homebrew ..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.bash_profile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
else
    echo "Found Homebrew already installed."
fi

# babashka is needed by clj-kondo.lsp build
if [ ! `which bb` ]
then
    echo "Installing Babashka ..."
    brew install borkdude/brew/babashka
else
    echo "Found Babashka already installed."
fi

# On 2022-Apr-17 this script installed the following versions on an
# Ubuntu 20.04 desktop Linux system:

# $ java -version
# openjdk version "1.8.0_312"
# OpenJDK Runtime Environment (build 1.8.0_312-8u312-b07-0ubuntu1~20.04-b07)
# OpenJDK 64-Bit Server VM (build 25.312-b07, mixed mode)
# 
# $ npm --version
# 6.14.4
# 
# $ code --version
# 1.66.2
# dfd34e8260c270da74b5c2d86d61aee4b6d56977
# x64
# 
# $ lein version
# Leiningen 2.9.8 on Java 1.8.0_312 OpenJDK 64-Bit Server VM
# 
# $ brew --version
# Homebrew 3.4.6
# Homebrew/homebrew-core (git revision 13871b22f43; last commit 2022-04-17)
# 
# $ bb --version
# babashka v0.8.1

# On 2022-Apr-17 this script installed the following versions on an
# Ubuntu 18.04 desktop Linux system:

# same as above for the Ubuntu 20.04 desktop Linux system, except for
# the version of npm installed, which was:

# $ npm --version
# 3.5.2
