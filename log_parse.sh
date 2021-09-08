cat somelog.csv | awk {'print "source: "$1" " "dest: "$2'} | grep -i '42.160.186.49' | sort | uniq -c | sort -r | head -10
#
sudo tcpdump -n -r filtered.pcap | awk -F" " '{print $3 }' | sort | uniq -c | head
