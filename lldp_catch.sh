#!/bin/bash
echo "Set if name:"
read en

tcpdump -nn -v -i $en -s 1500 -c 1 'ether proto 0x88cc'|grep -E 'System Name|Subtype Interface Name'
