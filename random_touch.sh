#!/bin/bash
ls | while read element
do
    touch $element
    sleep $[ ($RANDOM % 120) + 1 ]s
done
