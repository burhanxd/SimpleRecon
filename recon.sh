#! /bin/bash

banner(){
echo -e "\e[1;32m

$(figlet Simple Recon)
\e[0m "
echo " "
echo -e "\e[1;32m Features: Subdomain enumeration, Gau, httpx, subtakeover, waybackurls\e[0m"
echo -e "\e[1;32m         By: Burhan Chhotaudepur | Twitter/Insta: burhan__xd
                         Github: burhanxd       \e[0m"
echo " "
echo -e "\e[1;32m Run install.sh before running this script else it might give you erros\e[0m"
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
