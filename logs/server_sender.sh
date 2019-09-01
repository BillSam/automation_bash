#!/bin/bash

#rutas relativas
ROOT="/var/www"
WWW="$ROOT/mailserver"
SCRIPT="$WWW/scripts"
LOG="$WWW/log"

#levanto los sites
SITES=`cat $SCRIPT/site_mail_list.txt`

for SITE in $SITES; do

FROM=`echo $SITE | awk -F '::' '{print $1}'`
TO=`echo $SITE | awk -F '::' '{print $2}'`
DOMAIN=`echo $SITE | awk -F '::' '{print $3}'`
SUBJECT=`echo $SITE | awk -F '::' '{print $4}'`

echo "enviando mail $FROM - $TO - $DOMAIN"

$SCRIPT/send_mailx.sh $FROM $TO $DOMAIN $SUBJECT

echo ""
 
done

#fecha=$(date)  
#echo "corrio con fecha $fecha" >> "$LOG/server_sender.log"
$SCRIPT/rotate_log.sh 

exit 0
