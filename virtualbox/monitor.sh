#! /bin/bash

#./monitor.sh <ip>

ip=$1

#verifica si esta activo antes
ping -q -c2 $ip > /dev/null

if [ $? -eq 0 ]; then
	#la vm esta prendida	
	echo "1"
else
	#no vm esta apagada
	echo "0"
fi
