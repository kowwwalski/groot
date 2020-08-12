#!/bin/bash
#
# in this example I am reading the last string from massive file with comma-delimiter and seek for just 1 value in it by position
#
cat /path/to/file.csv | tail -1 | awk -F "," {'print $15'}
