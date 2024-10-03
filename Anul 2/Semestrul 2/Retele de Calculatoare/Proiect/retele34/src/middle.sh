#!/bin/bash
set -x
# add route to subnet 198.7.0.0/16 via IP 172.7.0.1
ip route add 172.7.0.0/16 via 198.7.0.1
# add 8.8.8.8 nameserver
echo "nameserver 8.8.8.8" >> /etc/resolv.conf

# we need to drop the kernel reset of hand-coded tcp connections
# https://stackoverflow.com/a/8578541
iptables -A OUTPUT -p tcp --tcp-flags RST RST -j DROP

# and redirect incoming traffic
# https://my.esecuredata.com/index.php?/knowledgebase/article/49/how-to-redirect-an-incoming-connection-to-a-different-ip-address-on-a-specific-port-using-iptables/

#not useful when want to capture traffic back from the server

#doar pt ex 1
#iptables -t nat -A POSTROUTING -j MASQUERADE 

#doar pt ex 2
#add nfque rule by default
iptables -I FORWARD -j NFQUEUE --queue-num 5

#iptables il vom schimba la rulare in functie de ex, cu iptables-restore < iptables_1.txt /2