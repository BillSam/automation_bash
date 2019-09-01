#!/bin/bash

SERVER=$1
USER=$2
SERVICE=$3
FOLDER=$4
SITE=$5

echo "creando carpeta log"
ssh -i id_rsa $USER@$SERVER sudo mkdir -p $FOLDER/$SITE/log 
echo "creando carpeta public"
ssh -i id_rsa $USER@$SERVER sudo mkdir -p $FOLDER/$SITE/public
echo "dando permisos de 775"
ssh -i id_rsa $USER@$SERVER sudo chmod -R 775 $FOLDER/$SITE
echo "dando permisos de grupos"
ssh -i id_rsa $USER@$SERVER sudo chown -R $SERVICE.$SERVICE $FOLDER/$SITE

exit 0