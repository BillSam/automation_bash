#!/bin/bash

SERVER=$1
USER=$2
DATE=$3
TIME=$4

#date +%Y%m%d -s "20120418"
echo "actualizar dia"
ssh -i id_rsa $USER@$SERVER sudo date +%Y%m%d -s $DATE

#date +%T -s "10:48:00"
echo "actualizar hora"
ssh -i id_rsa $USER@$SERVER sudo date +%T -s $TIME

exit 0