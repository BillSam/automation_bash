#!/bin/bash

SERVER=$1
USER=$2
REGLA=$3
SIMPLE=$4

#sudo ufw allow 993
if [ $SIMPLE -eq "0"];them	
	echo "habilitar regla ufw"
	ssh -i id_rsa $USER@$SERVER sudo ufw allow $REGLA
fi

#ufw allow from 15.15.15.0/24  to any port 22
#ufw allow from 10.193.5.148 to any port 22
if [ $SIMPLE -eq "1"];them	
	echo "habilitar regla ufw compleja"
	ssh -i id_rsa $USER@$SERVER sudo ufw $REGLA
fi

if [ $SIMPLE -eq "2"];them	
	echo "borrar una regla simple"
	TEST=$(sudo ufw verbose numbered | grep "80")



#sudo ufw verbose numbered | awk -F '[' '{print $2}' | awk -F ']' '{print $1}'
	ssh -i id_rsa $USER@$SERVER sudo ufw verbose numbered

	sudo ufw $REGLA
fi

 sudo ufw verbose numbered | awk -F '[' '{print $2}' | awk -F ']' '{print $2}' | awk -F ' ' '{print $1}'