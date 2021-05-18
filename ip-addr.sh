#!/bin/bash
extip=$(curl ifconfig.me/ip)
printf '=%.0s' {1..45} >> "/Users/$USER/Desktop/$USER.txt"
printf '\n' >> "/Users/$USER/Desktop/$USER.txt"
echo "Hostname is: $HOSTNAME" >> "/Users/$USER/Desktop/$USER.txt"
echo "External IP-address is: $extip" >> "/Users/$USER/Desktop/$USER.txt"
printf '=%.0s' {1..45} >> "/Users/$USER/Desktop/$USER.txt"
printf '\n' >> "/Users/$USER/Desktop/$USER.txt"
