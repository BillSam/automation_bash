#!/bin/bash

SERVER=$1
USER=$2
SERVERNAME=$3

ROUTEA='/etc/hosts'
ROUTEB='/etc/hostname'

echo "crea backup del host"
ssh -i id_rsa $USER@$SERVER sudo cp /etc/hosts	/etc/hosts.original

echo "configura dns nombre ipv4"
ssh -i id_rsa $USER@$SERVER echo "127.0.0.1		localhost localhost.localdomain localhost4 localhost4.localdomain4 $SERVERNAME" > $ROUTEA
echo "configura dns nombre ipv6"
ssh -i id_rsa $USER@$SERVER echo "::1         localhost localhost.localdomain localhost6 localhost6.localdomain6 $SERVERNAME" >> $ROUTEA

echo "configura nombre de server"
ssh -i id_rsa $USER@$SERVER echo $SERVERNAME > $ROUTEB