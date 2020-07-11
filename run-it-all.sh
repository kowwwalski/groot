#!/bin/bash
#current directory
dir=$(dirname "$0")
shopt -s dotglob
#goto each folder and run .sh scripts
find $dir/* -prune -type d | while IFS= read -r d; do
    script=$(ls $d | grep -i ".*.sh")
    (cd $d && exec ./$script)
done
