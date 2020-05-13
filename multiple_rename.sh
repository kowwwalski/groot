#!/bin/bash
for file in *.ext
do
    mv "$file" "${file%%.*}-appended-text.ext"
done
