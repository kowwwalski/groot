#!/bin/bash
#set variables
dir=$(dirname "$0")
prnname= #set desired printer display name
prnip= #set printer ip-address
prnloc= #set desired display location
#
#check installed printers in system and install if not exists
if [[ $(lpstat -p | awk '{print $2}' | grep -i "$prnname") ]]; then
    echo "Printer $prnname already installed. Check System Preferences > Printers & Scanners"
else
    echo "Printer $prnname not found. Installing..."
    # here we have ppd-like install, set path to ppd file
    lpadmin -p $prnname -L "$prnloc" -E -v socket://$prnip -P "$dir/path/to/PPD" -o printer-is-shared=false 2>/dev/null
    echo "Done!"
fi
#
# use lpadmin -x $prnname for removing already installed printer
