#!/bin/bash

SERVER=$1
USER=$2
USERCREATE=$3
USERNAME=$4
USERGROUP=$5
ACT=$6

if [ "$ACT" -eq "11"];then
	echo "crear usuario $USER"
	ssh -i id_rsa $USER@$SERVER sudo useradd -m -p $PASSWORD $USERCREATE

	echo "agregar datos de usuario"
	ssh -i id_rsa $USER@$SERVER sudo usermod -c $USERNAME $USERCREATE

	echo "agregar usuario a grupo"
	usermod -a -G $USERGROUP $USERCREATE
fi

if [ "$ACT" -eq "10"];then
	echo "borra usuario $USER"
	ssh -i id_rsa $USER@$SERVER sudo userdel $USERCREATE
fi

if [ "$ACT" -eq "21"];then
	echo "crear grupo $USERGROUP"
	ssh -i id_rsa $USER@$SERVER sudo groupadd $USERGROUP
fi

if [ "$ACT" -eq "20"];then
	echo "crear grupo $USERGROUP"
	ssh -i id_rsa $USER@$SERVER sudo groupdel $USERGROUP
fi

exit 0