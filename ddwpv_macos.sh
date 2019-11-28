#!/bin/bash
echo "Path to image file:"
read img
size=$(stat -f%z "$img")
echo "Set output (be careful with disks):"
read disk
dd if="$img" | pv -s $size | dd of=$disk
