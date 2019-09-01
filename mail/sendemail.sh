#!/bin/bash

USUARIO="$1"
PASSWORD="$2"

dia=`date +%d`
mes=`date +%m`
anio=`date +%Y`

DOMINIO='gmail.com'
PUERTO='587'

FECHA="$anio-$mes-$dia"

TEXT=`curl ifconfig.me`

sendemail -f $USUARIO@$DOMINIO -t $USUARIO@DOMINIO -s smtp.$DOMINIO:$PUERTO -u "MI IP ES" -m "MI IP A FECHA $FECHA ES $TEXT" -a $nombre_archivo -v -xu $USUARIO -xp $PASSWORD

