#!/bin/bash

#dia=`date +%d`
#mes=`date +%M`
#anio=`date +%Y`

#FECHA="$anio-$mes-$dia"

#time=`uptime | awk '{print $3,$4}'`

while : ; do
 
time=$(uptime)

echo $time >>  ~/BACKUP/tiempo_despierto.txt

sleep 5

done
