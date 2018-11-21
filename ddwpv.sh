#!/bin/bash
echo "Set image path:"
read image
#
size=$(stat --format="%s" $image)
#
echo "Set destination disk (be careful):"
read disk
#
sudo dd if=$image | pv -s $size | dd of=$disk
