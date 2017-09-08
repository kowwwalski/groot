#!/bin/bash
#Diagnose-automata
fldr=$(pwd)
date > $fldr/diag-log6.txt
echo "Enter hostname or IP-address: "
read hstnm
#
#check for empty and start diagnose:
if test -n $hstnm
then
  echo '***' >> $fldr/diag-log6.txt
  echo 'ping' >> $fldr/diag-log6.txt
  echo '***' >> $fldr/diag-log6.txt
  ping6 $hstnm -c 4 >> $fldr/diag-log6.txt
  echo '***' >> $fldr/diag-log6.txt
  echo 'traceroute' >> $fldr/diag-log6.txt
  echo '***' >> $fldr/diag-log6.txt
  traceroute6 -I $hstnm >> $fldr/diag-log6.txt
  echo '***' >> $fldr/diag-log6.txt
  echo 'ifconfig -a' >> $fldr/diag-log6.txt
  echo '***' >> $fldr/diag-log6.txt
  ifconfig -a >> $fldr/diag-log6.txt
  echo '***' >> $fldr/diag-log6.txt
  echo 'netstat -finet6 -rn' >> $fldr/diag-log6.txt
  echo '***' >> $fldr/diag-log6.txt
  netstat -finet6 -rn >> $fldr/diag-log6.txt
  echo '***' >> $fldr/diag-log6.txt
echo "Diagnostic result has been saved in diag-log6.txt"
else
echo "Cannot read hostname/ip"
fi
#
