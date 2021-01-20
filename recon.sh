#! /bin/bash

banner(){
echo -e "\e[1;32m

$(figlet Simple Recon)
\e[0m "
echo " "
echo -e "\e[1;32m        Read docs at https://github.com/burhanxd/SimpleRecon\e[0m"
echo -e "\e[1;32m                       By: Burhan Chhotaudepur
                  Github: https://github.com/burhanxd       \e[0m"
echo " "
echo -e "\e[1;32m Run this script as root and run install.sh to install all the tools\e[0m"
echo -e "\e[1;32m <------------------------------------------------------------------------>\e[0m"

}

banner
read -p "[+] Domain(ex: google.com): " domain

reconStart(){

mkdir -p $domain
echo -e "\e[1;34m [+] Enumerating Subdomain \e[0m"

subfinder -d $domain -o $domain/subdomains.txt -silent

echo -e "\e[1;34m [+] Finished and saved subdomains to $domain/subdomains.txt\e[0m"

echo -e "\e[1;34m [+] Fetching urls with GAU \e[0m"

gau -o $domain/gau.txt $domain

echo -e "\e[1;34m [+] Finished and saved URL's to $domain/gau.txt\e[0m"

echo -e "\e[1;34m [+] Fetching js file urls with gau\e[0m"

gau $domain |grep -iE '\.js'|grep -ivE '\.json'|sort -u >> $domain/jsurls.txt

echo -e "\e[1;34m [+] Finished and saved Js files to $domain/jsurls.txt\e[0m"

echo -e "\e[1;34m [+] Cleaning Jsurls \e[0m" 

cat $domain/jsurls.txt | antiburl > $domain/uncleaned.txt

cat $domain/uncleaned.txt | egrep -o "(http(s)?://){1}[^'\"]+" >> $domain/alivejs.txt

echo -e "\e[1;34m [+] Cleaned Jsurls and saved to $domain/alivejs.txt\e[0m"

echo -e "\e[1;34m [+] Collecting output from each JsUrl with collector.py \e[0m"

cat $domain/alivejs.txt | while read line; do python3 tools/LinkFinder/linkfinder.py -i $line -o cli >> $domain/output.txt | cat $domain/output.txt | python3 tools/collector.py $domain/output; done

echo -e "\e[1;34m [+] Finished and saved to $domain/output"

echo -e "\e[1;34m [+] Running Httpx for live host \e[0m"

cat $domain/subdomains.txt | httpx -silent -o  $domain/httpx.txt

echo -e "\e[1;34m [+] Finished and saved results to $domain/httpx.txt\e[0m"

echo -e "\e[1;34m [+] Fetching URL's with wayback urls \e[0"

cat $domain/subdomains.txt | waybackurls > $domain/wayback.txt

echo -e "\e[1;34m [+] Finished and saved results to $domain/wayback.txt\e[0m"

echo -e "\e[1;34m [+] Running subdomain takeover\e[0m"

cd /usr/local/go/SubOver && SubOver -l ~/SimpleRecon/$domain/subdomains.txt > ~/SimpleRecon/$domain/subtakeover.txt
echo -e "\e[1;34m [+] Saved subdomain takeover result to $domain/subtakeover.txt\e[0m"
echo -e "\e[1;34m [+] Finished all recon \e[0m"
}
reconStart
