#!/bin/bash
echo "Type username:"
read username
#cannot starts with keyword and may contain only 20 allowed characters
if [[ ! $username =~ ^keyword-* ]] && [[ $username =~ ^[a-z_][a-z0-9_-]{1,20}$ ]]; then
    echo "Ok. $username"
else
    echo "invalid input"
fi
