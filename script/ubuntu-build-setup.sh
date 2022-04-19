#! /bin/bash

# This script has been tested on the following versions of Linux,
# starting from a fresh minimal install:

#     Ubuntu 18.04 desktop Linux
#     Ubuntu 20.04 desktop Linux

set -x

CURDIR=$PWD

# clj-kondo.lsp currently requires JDK 8
sudo apt install --yes git curl openjdk-8-jdk

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

# babashka is needed by clj-kondo.lsp build
if [ ! `which bb` ]
then
    echo "Installing Babashka ..."
    sudo bash < <(curl -s https://raw.githubusercontent.com/babashka/babashka/master/install)
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
# $ lein version
# Leiningen 2.9.8 on Java 1.8.0_312 OpenJDK 64-Bit Server VM
# 
# $ bb --version
# babashka v0.8.1

# On 2022-Apr-17 this script installed the following versions on an
# Ubuntu 18.04 desktop Linux system:

# same as above for the Ubuntu 20.04 desktop Linux system.
