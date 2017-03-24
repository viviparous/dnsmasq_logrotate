A log-rotation script and daemon for dnsmasq. 

Simple stuff. Developed on OpenWrt.

Useful for archiving the DNS log file so I can analyse it. 

I use it for blocking YouTube advertising. For example, this command will find all the domains used in the DNS history (assuming sufficient history to be useful):

find [storagedir] -type f -exec unzip -p {} \; | grep -i googlevideo | awk '{print $6}' | sort | uniq -c | sort -n


I store the archives on a large USB flash stick attached to the router.


