#!/bin/bash

#Evitar que usuarios sin privilegios ejecuten el script

if [[ $EUID -ne 0 ]]; then
echo "Este script debe ser ejecutado por el usuario root" 1>&2
exit 1
fi
