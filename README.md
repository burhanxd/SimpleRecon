# Simple recon

Simple Recon is just a simple bash script to automate my recon process. I made it for my personal use but thought to share it with the community. Yeah, this script will be good for beginners who are just starting out in bug bounty or pentesting.

## Install and setup

- Install:

``` git clone https://github.com/burhanxd/SimpleRecon```

``` cd SimpleRecon ``` 

``` chmod +x recon.sh```

- Install GOLANG first if you didn't installed it

- Setup the tools before running the script

``` chmod +x install.sh ```

``` ./install.sh ```

## Using the script

``` ./recon.sh ```

``` [+]Domain (ex: google.com): hackerone.com ```

### Features:

- Subdomain enumeration

- Fetch urls from GAU and WayBackUrls

- Check for subdomain takeover

- Check for live host with HttpX

### Update

- Added LinkFinder

- Now, the script will find js files/urls with gau -> Find files with 200(live/exist) response and clean it -> separate params, file paths with collector.py and save it in output folder

### Credits to the original tools owner:

- SubOver: Ice3man

- HttpX: ProjectDiscovery

- Waybackurls: tomnomnom

- Subfinder: projectdiscovery

- Gau: lc

- LinkFinder: GerbenJavado

- collector.py: m4ll0k

- antiburl: tomnomnom

- I just gathered all tools and placed it in a bash script to automate all process.

### More:

- Feel free to contribute in this script to make it more effective and make recon easy.

### Connect:

- [Instagram](https://instagram.com/burhan__xd)

- [Twitter](https://twitter.com/burhan__xd)

- [LinkedIn](https://linkedin.com/in/burhan-chhotaudepur)
