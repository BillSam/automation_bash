#!/bin/bash

#OLD=$(cat ips.txt)

CPU_A=$(host cpu1 | cut -d' ' -f4)
CPU_B=$(host cpu2 | cut -d' ' -f4)
CPU_C=$(host cpu2 | cut -d' ' -f4)

UFWS=$(ufw verbose numbered | grep 9797 | awk -F ' ' '{print $1}'| awk -F '' '{print $2$3}')

for IPS in $UFWS
do

{
echo "delete rule $IPS"

{
sleep 3
echo "s"
sleep 3
} | ufw delete $IPS

} 

done

echo "allow $CPU_A"
ufw allow from $CPU_A to any port 9797

echo "allow $CPU_A"
ufw allow from $CPU_B to any port 9797

echo "allow $CPU_G"
ufw allow from $CPU_C to any port 9797

exit 0