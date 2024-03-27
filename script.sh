#!/bin/bash

#This script will get a domain name and should output a list of subdomains

url=$1
if [ ! -d "$url" ];then
        mkdir $url
fi

if [ ! -d "$url/recon" ] ;then
        mkdir $url/recon
fi


cd $url/recon
echo "[+] Starting to passivly enumerate Subdomains for $url"
echo "[+] Running Sublist3r..."
sublist3r -d $url -o sublist3r.txt > /dev/null


echo "[+] Enumerating subdomais with Amass..."
amass enum -d $url >> Amass.txt 
#this tool takes a long time but you can always turn it off with "ctrl c or #"
touch Amass.txt


echo "[+] Enumerating subdomais with Assetfinder..."
assetfinder --subs-only $url >> assetfinder.txt
 
echo "[+]Starting enumerate DNS and Subdomains with Fierce..."
fierce --domain $url >> fierce.txt 2>/dev/null

cat sublist3r.txt >> temp_subdomains.txt && cat Amass.txt >> temp_subdomains.txt && cat assetfinder.txt >> temp_subdomains.txt && cat fierce.txt >> temp_subdomains.txt
cat temp_subdomains.txt | sort | uniq >> subdomains.txt
rm temp_subdomains.txt

echo "[+] the sorted list of subdomains can be found here: $url/recon/subdomains.txt"
echo "[+] Probing fot HTTP/HTTPS servers with Httprobe..."
cat subdomains.txt | httprobe | sort | uniq >> httprobe.txt

echo "[+] Taking screenshots with Gowitness..."
gowitness file -f httprobe.txt 2> /dev/null
#sometimes this tool takes some time but you can do "ctrl c or #"
gowitness file -f httprobe.txt > /dev/null 2>&1
chmod 777 screenshots
