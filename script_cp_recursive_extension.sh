#/bin/bash

# zsh
mkdir target_directory \; cp **/*.xls target_directory

# bash
mkdir newDir \; find . -name \*.xls -exec cp {} /newDir \;

# bash script
find [SOURCEPATH] -type f -name '[PATTERN]' | 
    while read P; do cp --parents "$P" [DEST]; done

