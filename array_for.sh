#!/bin/bash
# random generated addresses for demo purposes only
declare -a arr=("56.87.164.240"
                "39.102.23.114"
                "123.205.84.201"
                "87.130.210.22"
                "85.175.230.243")

for i in "${arr[@]}"
do
  printf "IP-address: $i" && printf \\n
  whois "$i" | grep -iEw "netname|org-name"
  printf '=%.0s' {0..32} && printf \\n
done
