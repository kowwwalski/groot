#!/usr/bin/bash

#help
help()
{
echo "Data extractor syntax:"
echo "-h Print this help"
echo "-f define logfile for extraction"
echo "example: ./data_extractor.sh -f %logfile%"
}

#main
while getopts ":f:h" option; do
	case "$option" in
		f) if ! [ -f $OPTARG ]; then
			echo "File $OPTARG not found, please, check the path and filename"
		else
			echo "Processing $OPTARG, stay tuned..."
			#
			echo "Collecting unique event sources"
			event_sources="event_sources_$(date "+%Y.%m.%d-%H:%M:%S").log"
			sources=$(cat $OPTARG | cut -d " " -f4 | sort | uniq | wc -l)
			echo "$sources unique event sources found:" > $event_sources && cat $OPTARG | cut -d " " -f4 | sort | uniq >> $event_sources
			#
			echo "Collecting Cisco ASA event types"
			cisco_types="cisco_types_$(date "+%Y.%m.%d-%H:%M:%S").log"
			echo "Cisco ASA event types:" > $cisco_types && grep "%ASA" $OPTARG | cut -d " " -f5 | sort | uniq -c | sort -nr >> $cisco_types
			#
			echo "Collecting Cisco ASA msg IP-addresses"
			cisco_msg_ips="cisco_msg_ips_$(date "+%Y.%m.%d-%H:%M:%S").log"
			ips_count=$(grep "%ASA-" $OPTARG | awk -F "[0-9]: " '{print $2}' | grep -oE "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | sort | uniq | sort -nr | wc -l)
			echo "$ips_count unique IP-addresses entries found in Cisco ASA messages:" > $cisco_msg_ips && grep "%ASA-" $OPTARG | awk -F "[0-9]: " '{print $2}' | grep -oE "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | sort | uniq -c | sort -nr >> $cisco_msg_ips
			#
		fi
		exit;;
		:) echo "Required argument is missing, please, run script with -h flag for help"
		exit;;
		h) help
		exit;;
		\?) echo "Invalid option, please, run script with -h flag for help"
		exit;;
	esac
done

shift "$((OPTIND-1))"

#no flags
echo "Running w/o flags, please, run script with -h flag for help"
