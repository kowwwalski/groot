#!/bin/bash
echo Input MAC:
read mac
echo $mac | awk '{print toupper($0)}' | sed s/":"/""/g | sed s/"-"/""/g
