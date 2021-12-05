#/bin/bash

# zsh
mkdir target_directory \; cp **/*.xls target_directory

# bash
mkdir newDir \; find . -name \*.xls -exec cp {} /newDir \;

