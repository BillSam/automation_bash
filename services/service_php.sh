#!/bin/sh

#Verificar que un servicio/proceso se está ejecutando

BIN="/usr/bin/php5.6"
ROOT="/var/www/api/back"
APP="$ROOT/service.php"
LOG="$ROOT/service.log"

SERVICE='service.php'
if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
echo "El servicio $SERVICE esta ejecutandose"
else
echo "El servicio $SERVICE esta detenido"

echo "levantar servicio"

echo "date \n" >> $LOG
$BIN $APP & >> $LOG

fi

