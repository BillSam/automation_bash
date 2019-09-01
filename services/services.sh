#!/bin/bash

SERVER=$1
USER=$2
SERVICE=$3
ACT=$4

if (( $( ssh -i id_rsa $USER@$SERVER ps -ef | grep -v grep | grep $SERVICE | wc -l) > 0 )); then
	echo "$SERVICE is running!!!"
	EST="1"
else
	echo "$SERVICE in no running"
	EST="0"
fi

if [ "$ACT" -eq "1" ] && [ $EST -eq "0" ];then
	echo "starting service"
	ssh -i id_rsa $USER@$SERVER sudo systemctl restart $SERVICE 
fi

if [ "$ACT" -eq "0" ] && [ $EST -eq "1" ];then
	echo "stoping service"
	ssh -i id_rsa $USER@$SERVER sudo systemctl stop $SERVICE
fi

exit 0