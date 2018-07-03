#!/bin/bash
echo "Set if name:"
read en

tcpdump -nn -v -i $en -s 1500 -c 1 'ether[20:2] == 0x2000' | grep -E 'Device-ID|Port-ID'
