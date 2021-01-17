#! /bin/bash
echo -e "\e[1;32m [+] If you didn't install Golang on your system then install it first \e[0m"
echo -e "\e[1;32m [+] Installing all necessary tools\e[1;32"
go get github.com/tomnomnom/waybackurls
GO111MODULE=on go get -u -v github.com/lc/gau
go get github.com/Ice3man543/SubOver
GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
GO111MODULE=on go get -v github.com/projectdiscovery/httpx/cmd/httpx

echo -e "\e[1;32m [+] All tools installed. Now you are good to go\e[0m"
