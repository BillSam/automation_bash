#!/bin/bash 

#toma parametors
FECHA=$(DATE)

#rutas relativas
ROOT="/var/www"
WWW="$ROOT/mailserver"
LOG="$WWW/log"

echo "corrio con fecha $FECHA" >> "$LOG/server_sender.log"

#touch /script_logs/test.log
MaxFileSize=1024
#while true
#do
	#sh test.sh >> /script_logs/test.log
	#Get size in bytes** 
	file_size=`du -b $LOG/server_sender.log | tr -s '\t' ' ' | cut -d' ' -f1`
	if [ $file_size -gt $MaxFileSize ];then   
		timestamp=`date +%G%m%j%k%M`
		mv $LOG/server_sender.log $LOG/server_sender.log.$timestamp
		
		NAME="$LOG/server_sender.log.$timestamp"
		
		tar -czvf $NAME.tar.gz $NAME
		
		rm $NAME
		
		touch $LOG/server_sender.log
	fi

#done