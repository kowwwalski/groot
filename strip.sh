#!/bin/bash
# here we trying to remove any EXIF-data from all files in current directory
#
ls | while read element
do
    mogrify -strip -taint $element
done
