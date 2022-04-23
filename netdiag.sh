#!/bin/bash
#Diagnose-automata
fldr=$(pwd)
date > "$fldr"/diag-log.txt
echo "Enter hostname or IP-address: "
read hstnm
#
#check for empty and start diagnose:
if test -n "$hstnm"
then
  echo '***' >> "$fldr"/diag-log.txt
  echo 'ping' >> "$fldr"/diag-log.txt
  echo '***' >> "$fldr"/diag-log.txt
  ping "$hstnm" -c 4 >> "$fldr"/diag-log.txt
  echo '***' >> "$fldr"/diag-log.txt
  echo 'traceroute' >> "$fldr"/diag-log.txt
  echo '***' >> "$fldr"/diag-log.txt
  traceroute -I "$hstnm" >> "$fldr"/diag-log.txt
  echo '***' >> "$fldr"/diag-log.txt
  echo 'ifconfig -a' >> "$fldr"/diag-log.txt
  echo '***' >> "$fldr"/diag-log.txt
  ifconfig -a >> "$fldr"/diag-log.txt
  echo '***' >> "$fldr"/diag-log.txt
  echo 'netstat -rn' >> "$fldr"/diag-log.txt
  echo '***' >> "$fldr"/diag-log.txt
  netstat -rn >> "$fldr"/diag-log.txt
  echo '***' >> "$fldr"/diag-log.txt
echo "Diagnostic result has been saved in diag-log.txt"
else
echo "Cannot read hostname/ip"
fi
#
