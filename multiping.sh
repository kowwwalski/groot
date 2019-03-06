#!/bin/bash
cat /path/to/nodelist |  while read output
do
    ping -c 1 "$output" >> /dev/null
    if [ $? -eq 0 ]; then
        echo "$output is up" >> /path/to/logfile
    else
        echo "$output is down" >> /path/to/logfile
    fi
done
