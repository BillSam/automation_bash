#!/bin/bash

SERVER=$1
USER=$2

echo "borrando timezone viejo"
ssh -i id_rsa $USER@$SERVER rm -fv /etc/localtime

echo "configurar timezone nuevo"
ssh -i id_rsa $USER@$SERVER sudo ln -s /etc/localtime /usr/share/zoneinfo/America/Argentina/Buenos_Aires

exit 0