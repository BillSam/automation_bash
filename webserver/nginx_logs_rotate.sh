#!/bin/bash

DIR=$(ls /var/www/)
DIRE='/var/www'
DATE=$(date +%Y-%m-%d-%H%M)


for LINEA in $DIR
do

#echo $LINEA/log
DI="$DIRE/$LINEA/log"
echo "$DI"

mv $DI/access.log $DI/access.log.$DATE
mv $DI/error.log $DI/error.log.$DATE

kill -USR1 `cat /var/run/nginx.pid`

sleep 1

gzip $DI/access.log.$DATE
gzip $DI/error.log.$DATE

done
