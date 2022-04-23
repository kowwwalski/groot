#!/bin/bash
#reboots printers (HP mostly) from list every 30min 10 times
for (( i = 1; i < 10; i++ ))
do
cat /path/to/hostlist | while read host
do
	snmpset -v 1 -c public "$host" ".1.3.6.1.2.1.43.5.1.1.3.1" i 4
sleep 1800
done
done
