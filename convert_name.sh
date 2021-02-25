#!/bin/bash
dispname='Alexander Matrosov'

loginname=$(echo $dispname | awk '{print tolower($0)}' | sed -e 's/[[:space:]]/\./g')
echo $loginname

exit 0
