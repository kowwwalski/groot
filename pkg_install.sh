#!/bin/bash
#set variables
dir=$(dirname "$0")
appname= # set your application (in my case .pkg was into the .dmg, that's the reason)
pkgname= # set your pkg-name (in most cases it contains part of the final App name in system)
img=$(ls $dir | grep -i "$appname.*.dmg$")
#
if [[ $(ls /Applications | grep -i "$pkgname") ]]; then
	echo "Already installed! Check Applications folder!"
else
	echo "Not found. Installing..."
	#mount img
	hdiutil attach $dir/$img
	mntpoint=$(ls /Volumes | grep -i "$appname")
	#run pkg
	pkgfile=$(ls /Volumes/"$mntpoint" | grep -i "$pkgname")
  # here we need interactive user auth
	sudo installer -pkg /Volumes/"$mntpoint"/"$pkgfile" -target /Applications
	#detach img
	hdiutil detach /Volumes/"$mntpoint"
	echo "Installation complete"
fi
