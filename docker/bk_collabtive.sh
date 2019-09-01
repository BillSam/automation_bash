#!/bin/bash

NAME="collabtive"
ORIGIN="/var/www/html"
DESTIN="/data/backup/$NAME"
DOCK='pepe'

dia=`date +%d`
mes=`date +%m`
anio=`date +%Y`

FECHA="$anio-$mes-$dia"

echo "borrar backup viejo"

rm -frv $DESTIN/$NAME.*

echo "docker copy"

docker cp $DOCK:$ORIGIN $DESTIN

echo "files compresion"

tar -czvf $DESTIN/$NAME.$FECHA.tar.gz /data/backup/$NAME/html

echo "erase old files"

rm -frv $DESTIN/html
