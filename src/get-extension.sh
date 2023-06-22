#!/bin/bash
EXT=$1
VER=${2:-1.39}

VER_STRING="REL${VER/./_}"
#curl --no-progress-meter -G --connect-timeout 5  -H "Connection: close"  -o ${EXT}.html https://www.mediawiki.org/wiki/Special:ExtensionDistributor?extdistname=${EXT}&extdistversion=REL${VER}

curl "https://www.mediawiki.org/wiki/Special:ExtensionDistributor?extdistname=${EXT}&extdistversion=${VER_STRING}" --compressed -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8' -H 'Accept-Language: en-GB,en;q=0.5' -H 'Accept-Encoding: gzip, deflate, br' -H 'DNT: 1' -H 'Connection: keep-alive' -H 'Upgrade-Insecure-Requests: 1' -H 'Sec-Fetch-Dest: document' -H 'Sec-Fetch-Mode: navigate' -H 'Sec-Fetch-Site: cross-site' -H 'Pragma: no-cache' -H 'Cache-Control: no-cache' -H 'TE: trailers' -o "/tmp/${EXT}.html"

sleep 1

url=$(grep -Po "https://.*?${EXT}.*?\.tar\.gz" "/tmp/${EXT}.html" | head -n 1)
wget "$url"
