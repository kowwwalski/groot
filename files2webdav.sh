#!/bin/bash
echo "Type your webdav username"
read username
echo "Type your webdav password"
read password
# in this example I have a list with urls of few .jpg-files
#
cat %/path/to/url-list% | while read list
do
    wget "$list" # read each string of url-list and download
done
#
# then upload each .jpg-file to destination webdav-server
for f in *.jpg
do
    curl -T "$f" -u "$username":"$password" https://webdav.your-server-name.com/"$f"
done
