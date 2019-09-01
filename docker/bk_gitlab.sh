#!/bin/bash

NAME="gitlab"
ORIGIN="/data/gitlab"
DESTIN="/data/backup/$NAME"

dia=`date +%d`
mes=`date +%m`
anio=`date +%Y`

FECHA="$anio-$mes-$dia"

echo "borrar backup viejo"

rm -frv $DESTIN/$NAME.*

echo "files compresion"

tar -czvf $DESTIN/$NAME.$FECHA.tar.gz $ORIGIN


