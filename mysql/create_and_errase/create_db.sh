#!/bin/bash

USER="admin"
PASS="admin123"
DATABASE="$1"
HOST="127.0.0.1"
SQL="create database $DATABASE"

echo "creando base de datos"

mysql -u$USER -p$PASS -h$HOST --execute="$SQL"

echo "listar bases"

mysql -u$USER -p$PASS -h$HOST --execute="show databases"


