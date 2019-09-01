#!/bin/bash

#firewall version 3.0

DATO=$1

if [ -z $DATO ] ; then
	echo "Comandos del Firewall"
	echo "on   - permitir salida a internet"
	echo "off  - denegar salida a internet"
	echo "up   - prender firewall"
	echo "down - apagar firewall"
	echo "-v   - ver estado de firewall"

read -p "Seleccione la opcion deseada : " DATO

fi

	if [ $DATO = on ]; then
	        
		echo "permitir salida de datos"
		sudo ufw enable	        
		sudo ufw default allow outgoing
	        sudo ufw status verbose
	fi
	
	if [ $DATO = off ]; then
	        echo "no permitir salida de datos"
		sudo ufw enable
	        sudo ufw default deny outgoing
		sudo ufw allow to 192.168.1.1/255.255.255.0	        
		sudo ufw allow from 192.168.1.1/255.255.255.0
		sudo ufw status verbose

	fi
	
	
	if [ $DATO = up ]; then
	        echo "prender firewall"
	        sudo ufw enable 
	        sudo ufw status verbose
	fi

	if [ $DATO = down ]; then
	        echo "apagar firewall"
	        sudo ufw disable 
	        sudo ufw status verbose
	fi

	if [ $DATO = -v ]; then
	        echo "ver estado del firewall"
	        sudo ufw status verbose
	fi

