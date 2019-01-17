#!/bin/bash
echo "Input new archive name(*.zip):"
read arch
echo "Set folder path:"
#set the full path to save directory tree
read folder
zip -er $arch $folder
