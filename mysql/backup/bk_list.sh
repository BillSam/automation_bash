#!/bin/bash

#[[ $@ ]] || {
#    printf "Usage\n\t./$0 <prod 0 --- dev 1> \n"
#    exit 1
#}

#lista de backups

./bk_devdbdtims01.sh  

./bk_devdbdtims02.sh  

#copia al remoto
./backup_remote.sh 
