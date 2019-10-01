#!/bin/bash
echo "Type network name:"
read nwname
nmcli -f SSID,BSSID,ACTIVE dev wifi list | grep -i $nwname
