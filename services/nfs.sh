#!/bin/bash

SERVER=$1
USER=$2
RULE=$3
ACT=$4

if [ "$ACT" -eq "0"];them
	echo "agrega regla"
	ssh -i id_rsa $USER@$SERVER sudo echo $RULE >> /etc/exports
	echo "reiniciar nfs"
	ssh -i id_rsa $USER@$SERVER sudo systemclt restart nfs
fi

if [ "$ACT" -eq "0"];them
	echo "borra regla regla"
	ssh -i id_rsa $USER@$SERVER sudo sed '/$RULE/d' /etc/exports
	echo "reiniciar nfs"
	ssh -i id_rsa $USER@$SERVER sudo systemclt restart nfs
fi