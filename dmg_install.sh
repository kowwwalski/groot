#!/bin/bash
#set variables
dir=$(dirname "$0")
appname= #set your application, for example "VLC"
img=$(ls $dir | grep -i "$appname.*.dmg$")
#
#check application in system
if [[ $(ls /Applications | grep -i "$appname") ]]; then
    echo "Application $appname already installed!"
else
    echo "Application $appname not found. Installing..."
    #mount and copy application
    hdiutil attach $dir/$img
    mntpoint=$(ls /Volumes | grep -i "$appname")
    cp -pPR /Volumes/"$mntpoint"/*.app /Applications
    #detach img file
    hdiutil detach /Volumes/"$mntpoint"
    echo "Installation complete!"
fi
