#!/bin/bash

SERVER=$1
USER=$2
SO=$3

if [ "$SO" == "centos" ]; then
	echo "actualizar pendientes en centos"
	ssh -i id_rsa $USER@$SERVER sudo yum -y update 
fi

if [ "$SO" == "ubuntu" ]; then
	echo "actualizar pendientes en centos"
	ssh -i id_rsa $USER@$SERVER sudo apt-get -y upgrade
fi

exit 0