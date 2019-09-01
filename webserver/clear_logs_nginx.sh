#!/bin/bash

DIR=$(ls /var/www/)
DIRE='/var/www'
DATE=$(date +%Y-%m-%d-%H%M)

#tiempo en dias
TIME="7"

for LINEA in $DIR
do

#echo $LINEA/log
DI="$DIRE/$LINEA/log"
echo "$DI"

#busca y borra logs viejos
find $DI -mtime +$TIME -exec rm -fv {} +

#kill -USR1 `cat /var/run/nginx.pid`

#sleep 1

done
