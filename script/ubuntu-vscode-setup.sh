#! /bin/bash

# This script has been tested on the following versions of Linux,
# starting from a fresh minimal install:

#     Ubuntu 18.04 desktop Linux
#     Ubuntu 20.04 desktop Linux

set -x

CURDIR=$PWD

# npm needed for 'npm install' step of clj-kondo.lsp
sudo apt install --yes npm

# Install VSCode
sudo snap install code --classic

# On 2022-Apr-17 this script installed the following versions on an
# Ubuntu 20.04 desktop Linux system:

# $ npm --version
# 6.14.4
# 
# $ code --version
# 1.66.2
# dfd34e8260c270da74b5c2d86d61aee4b6d56977
# x64

# On 2022-Apr-17 this script installed the following versions on an
# Ubuntu 18.04 desktop Linux system:

# same as above for the Ubuntu 20.04 desktop Linux system, except for
# the version of npm installed, which was:

# $ npm --version
# 3.5.2
