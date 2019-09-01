#!/bin/bash

INSTANCIAS='4'
VERSION='04'
CONTA='apache'

echo "borrando container viejos"
DOCK=$(docker ps -a | grep $CONTA | awk -F ' ' '{print $1}')

for i in $DOCK; do
	echo "borrando $1"
	echo "docker rm -fv $i"
	#docker rm -fv $i
done

CONT="3"

for (( c=1; c<=$INSTANCIAS; c++ )); do  
	
	echo "creando container $c"
	let CONT+=1
	echo "CONT $CONT"
	echo "c $c"
	#docker run -dit -p8$CONT:80 -p44$CONT:443 --restart unless-stopped --cpus 2 --memory 2048m --memory-swap 2048m --name apache0$c -v /var/www/campus:/var/www/campus rep.aysa.com.ar/ubuntu18_apache_php5.6:$VERSION
	echo "docker run -dit -p8$CONT:80 -p44$CONT:443 --restart unless-stopped --cpus 2 --memory 2048m --memory-swap 2048m --name apache0$c -v /var/www/campus:/var/www/campus rep.aysa.com.ar/ubuntu18_apache_php5.6:$VERSION"
   
done

exit 0


