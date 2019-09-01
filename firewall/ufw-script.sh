#!/bin/sh
# ufw script
#

ufw disable
ufw --force reset

NET_PRIVATE_ADDR=(10.0.0.0/8 172.16.0.0/12 192.168.0.0/16)
for i in ${NET_PRIVATE_ADDR[@]}; do ufw allow from $i to any app 'SSH'; done
for i in ${NET_PRIVATE_ADDR[@]}; do ufw allow from $i to any app 'WWW Full'; done
for i in ${NET_PRIVATE_ADDR[@]}; do ufw allow from $i to any app 'IPP'; done
for i in ${NET_PRIVATE_ADDR[@]}; do ufw allow from $i to any app 'CIFS'; done

ufw limit ssh/tcp

# mpd
#ufw allow 6600/tcp
ufw allow in proto tcp from 192.168.0.0/16 to any port 6600

# UPnP
ufw allow in proto udp from 192.168.0.0/16 to any port 1900

# Rygel
# ~/.config/rygel.conf:
# port=65530
ufw allow in proto tcp from 192.168.0.0/16 to any port 65530

ufw logging low

ufw enable
#ufw status