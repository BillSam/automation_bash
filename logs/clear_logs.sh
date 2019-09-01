#!/bin/bash

DIRE='/var/www'
DIR=$(ls $DIRE)
DATE=$(date +%Y-%m-%d-%H%M)

#tiempo en dias
TIME="7"

for LINEA in $DIR
do

LIST=$DIRE/$LINEA

        SITE=$( ls $LIST)
        #echo "SITE $SITE"

        for LINEB in $SITE
        do

        #echo "$DIRE/$LINEA/$LINEB"

        DI="$DIRE/$LINEA/$LINEB/log"
        #echo "$DI"
        FIA=$DI/error

        #busca y borra logs viejos
        find $DI -mtime +$TIME -exec rm -fv {} +

        #find $DI -mtime +$TIME

        #kill -USR1 `cat /var/run/nginx.pid`
 #sleep 1
        done

done
