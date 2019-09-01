#!/bin/bash

ROOT="/data/scripts"

#ejucutando mondao de disco remotos tbs005
$ROOT/mount.sh

#borrando archivos viejos
rm -frv /data/backups/remote_mysql/*

#copiando archivos de local a remoto
cp -frv /data/backups/mysql/* /data/backups/remote_mysql

#desmontando carpeta
$ROOT/umount.sh
