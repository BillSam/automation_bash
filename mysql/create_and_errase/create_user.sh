#!/bin/bash

USER="admin"
PASS="admin123"
DATABASE="$1"
HOST="127.0.0.1"
#SQL=

echo "creando usuario"

mysql -u$USER -p$PASS -h$HOST --execute="CREATE USER $DATABASE@'%' IDENTIFIED BY '$DATABASE';"

echo "dando permisos"

mysql -u$USER -p$PASS -h$HOST --execute="GRANT ALL PRIVILEGES ON $DATABASE.* to $DATABASE@'%' with grant option;"

echo "listar usuarios"

mysql -u$USER -p$PASS -h$HOST --execute="select User from mysql.user;"
