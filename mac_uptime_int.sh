#!/bin/sh
uptime | sed 's/^.*up //g' | sed 's/[^.*]days.*//g'
