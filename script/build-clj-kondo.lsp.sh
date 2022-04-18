#! /bin/bash

if [ -d .git -a -d vscode-extension ]
then
    echo "Found directories .git and vscode-extension"
else
    2>&1 echo "At least one of .git and vscode-extension directories is not present."
    2>&1 echo ""
    2>&1 echo "This command must be run from inside top level directory of"
    2>&1 echo "a clone of the Github repository:"
    2>&1 echo "    https://github.com/clj-kondo/clj-kondo.lsp"
    exit 1
fi

set -x

# Follow instructions from clj-kondo.lsp README.md
bb vscode-server

cd vscode-extension
npm install
