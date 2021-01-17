# Simple recon

Simple Recon is just a simple bash script to automate my recon process. I made it for my personal use but thought to share it with the community. Yeah, this script will be good for beginners who are just starting out in bug bounty or pentesting.

## Install and setup

- Install:

``` git clone https://github.com/Simplerecon```

``` chmod +x recon.sh```

- Install GOLANG first if you didn't installed it

- Setup the tools before running the script

``` chmod +x install.sh ```

## Using the script

``` ./recon.sh ```

``` [+]Domain (ex: google.com): hackerone.com ```

### Features:

- Subdomain enumeration

- Fetch urls from GAU and WayBackUrls

- Check for subdomain takeover

- Check for live host with HttpX

### Credits to the original tools owner:

- SubOver: Ice3man

- HttpX: ProjectDiscovery

- Waybackurls: tomnomnom

- Subfinder: projectdiscovery

- I just gathered all tools and placed it in a bash script to automate all process.
