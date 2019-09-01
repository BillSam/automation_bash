#!/bin/bash

SERVER=$1
USER=$2
SERVICE=$3
SO=$4
ACT=$5
FILEA='yum.conf'
FILEB='apt.conf'

///////////////////////////////////////////////////////////////////////////////
//centos

if [ "$ACT" -eq "11"];then
	TEST=$( ssh -i id_rsa $USER@$SERVER ls /etc | grep $FILEA )

	if [ -n "$TEST" ]; then
		echo "moviendo archivo de new a old"
		ssh -i id_rsa $USER@$SERVER sudo cp /etc/$FILE /etc/$FILEA.old
	else
		echo "no existe el archivo $FILEA"
		echo "se copia un fichero vacio"
		scp -i id_rsa yum.conf.old $USER@$SERVER:/home/$USER/
		echo "se mueve el fichero vacio a old"
		ssh -i id_rsa $USER@$SERVER sudo cp /home/$USER/yum.conf.old /etc/$FILE.old	
	fi

	TEST=$( ssh -i id_rsa $USER@$SERVER ls /home/$USER/$FILEA | grep $FILEA )

	if [ -n "$TEST" ]; then
		echo "exite el archivo, y se manda a borra"
		ssh -i id_rsa $USER@$SERVER sudo rm -f /home/$USER/$FILEA
		echo "copiando archivo de internet"
		scp -i id_rsa $FILEA $USER@$SERVER:/home/$USER/
	else
		echo "no existe el archivo"
		echo "copiando archivo de internet"
		scp -i id_rsa $FILEA $USER@$SERVER:/home/$USER/
	fi	

	echo "moviendo archivo"
	ssh -i id_rsa $USER@$SERVER sudo mv /home/$USER/$FILEA /etc/$FILEA
fi

if [ "$ACT" -eq "10"];then
	TEST=$( ssh -i id_rsa $USER@$SERVER ls /etc | grep $FILEA )
	if [ -n "$TEST" ]; then
		echo "borrando archivo de internet"
		ssh -i id_rsa $USER@$SERVER sudo rm -f /etc/$FILEA
	else
		echo "no existe el archivo de internet"
	fi

	echo "moviendo archivo old a new"
	ssh -i id_rsa $USER@$SERVER sudo mv /etc/$FILEA.old /etc/$FILEA
fi
//////////////////////////////////////////////////////////////////////////////////
//ubuntu
if [ "$ACT" -eq "21"];then
	TEST=$( ssh -i id_rsa $USER@$SERVER ls /home/$USER/$FILEB | grep $FILEB )

	if [ -n "$TEST" ]; then
		echo "exite el archivo, y se manda a borra"
		ssh -i id_rsa $USER@$SERVER sudo rm -f /home/$USER/$FILEB
		echo "copiando archivo de internet"
		scp -i id_rsa $FILEB $USER@$SERVER:/home/$USER/
	else
		echo "no existe el archivo"
		echo "copiando archivo de internet"
		scp -i id_rsa $FILEB $USER@$SERVER:/home/$USER/
	fi	

	echo "moviendo archivo"
	ssh -i id_rsa $USER@$SERVER sudo mv /home/$USER/$FILEB /etc/apt/apt.conf.d/$FILEB
fi

if [ "$ACT" -eq "20"];then
	TEST=$( ssh -i id_rsa $USER@$SERVER ls /etc/apt/apt.conf.d/ | grep $FILEB )
	if [ -n "$TEST" ]; then
		echo "borrando archivo de internet"
		ssh -i id_rsa $USER@$SERVER sudo rm -f /etc/$FILEA
	else
		echo "no existe el archivo de internet"
	fi
fi


exit 0
