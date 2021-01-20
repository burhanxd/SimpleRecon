#! /bin/bash
echo -e "\e[1;32m [+] If you didn't install Golang on your system then install it first \e[0m"
echo -e "\e[1;32m [+] Installing all necessary tools\e[1;32"
mkdir tools
cd tools
go get github.com/tomnomnom/waybackurls
GO111MODULE=on go get -u -v github.com/lc/gau
go get github.com/Ice3man543/SubOver
GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder
GO111MODULE=on go get -v github.com/projectdiscovery/httpx/cmd/httpx
git clone https://github.com/GerbenJavado/LinkFinder
cd LinkFinder
pip3 install -r requirements.txt
sudo python3 setup.py install
cd .. 
wget https://raw.githubusercontent.com/m4ll0k/Bug-Bounty-Toolz/master/collector.py
mkdir antiburl
cd antiburl
wget https://raw.githubusercontent.com/tomnomnom/hacks/master/anti-burl/main.go
go build
sudo cp antiburl /usr/local/bin
echo -e "\e[1;32m [+] All tools installed. Now you are good to go\e[0m"
