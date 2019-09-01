#!/bin/bash

#[[ $@ ]] || {
#    printf "Usage\n\t./$0 <prod 0 --- dev 1> \n"
#    exit 1
#}

#banderas	flag01		flag02		flag03
#estado		carpeta		disco montado	permisos escritura
#frag=0 bien | flag=1 error
#datos conexion
USER="user"
PASS="password"
HOST="127.0.0.1"
PORT="3310"
#carpeta del equipo
SERV="devdbdtims02"
#modalida ejecucion o prueba
DEV="0"
#carga variables de la fecha de ejecucion	
dia=`date +%d`
mes=`date +%m`
anio=`date +%Y`
FECHA="$anio-$mes-$dia"	
HORA=`date`
#identifica carpetas
ROOT="data"
LOG_FILE="logs"
BACKUP_FOLDER="backups"
APP="mysql"
#arma rutas
LOG="/$ROOT/$LOG_FILE/bk_$SERV.log"
BACKUP="/$ROOT/$BACKUP_FOLDER/$APP"
#carpetas a realizar backup
#DIRMYCNF="/etc/my.cnf"
#carpeta nueva del backup
DIRBK="$BACKUP/$SERV-$FECHA"

#borra la carpeta vieja
if [ $DEV -eq  0 ];then
	rm -fr $BACKUP/$SERV-*
fi
#verifica si existe la carpeta DIRBK		
if [ -d $DIRBK ]; then
	echo "existe la carpeta DIRBK, no se hace nada"
else
    #no existe la carpeta DIRBK se procede a crearla
	if [ $DEV -eq  0 ];then
		mkdir $DIRBK
	fi
			
    if [ -d $DIRBK ]; then
		echo "se puede continuar con la ejecucion del backup"
	fi
fi
#Empieza el backup			
if [ -d $DIRBK ]; then
	#se verifica si existe la carpeta DIRBK
	echo "copia las configuraciones del servidor"
				
#	if [ $DEV -eq  0 ];then
#		cp -fRv $DIRMYCNF  $DIRBK
#	fi
				
	#############################################################33
	LINEAS=`mysql -h$HOST -P$PORT -u$USER -p$PASS -e "show databases"| wc -l`
	BASES=`mysql -h$HOST -P$PORT -u$USER -p$PASS -e "show databases"| tail -n7`
	#aumenta una linea
	let LINEAS+=1
	CONTI="1"
	#bucle para insertar en nuevo usuario
	while [ $CONTI -lt $LINEAS ]; do
		BASE=`echo "$BASES" | head -n$CONTI | tail -n1 `
		NAMEFILE="$BASE.sql" 
		FILE="$DIRBK/$NAMEFILE"
		#verifica que el archivo no este en la capeta dump
		if [ -d $DIRBK ]; then
			echo "hace backup"                
			mysqldump -h$HOST -P$PORT -u$USER -p$PASS $BASE > $FILE --lock-tables=false
		fi
		#echo "$BASE"
		#echo " "
		#echo $CONT1
    	#aumenta la cuenta
		let CONTI+=1
	done 
#fin bucle while
fi		
#deja log
#echo "BACKUP de $SERV fecha -- $HORA --- estado $flag01 $flag02 $flag03 $flag04" >> $LOG
#sale del script
exit 0
