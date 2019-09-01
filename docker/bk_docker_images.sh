#!/bin/bash

NAME="gitlab"
ORIGIN="/data/gitlab"
DESTIN="/data/backup/$NAME"

dia=`date +%d`
mes=`date +%m`
anio=`date +%Y`

FECHA="$anio-$mes-$dia"

docker save -o /data/backup/images/gitlab-ce.tar gitlab/gitlab-ce:latest

docker save -o /data/backup/images/dolibarr.tar monogramm/docker-dolibarr:latest

docker save -o /data/backup/images/mariadb.tar mariadb:latest

docker save -o /data/backup/images/mongo.tar mongo:3.0
