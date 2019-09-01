#! /bin/bash

#./control.sh <accion> <vmid> <vmname> 

ACCION=$1
VMID=$2
VMNAME=$3

#formato logs control
dia=`date +%d`
mes=`date +%m`
anio=`date +%Y`
hora=`date +%H:%M`

FECHA00="$anio-$mes-$dia"
FECHA01="$anio-$mes-$dia-$hora"

ROOT="/bob"
GROUP="$ROOT/bash"
TIPE="$GROUP/logs"
LOG_ROOT="$TIPE/VirtualBox"
FILE="$LOG_ROOT/control_vms_$FECHA00.txt"

#usuario que corre la vms
VMUSER=bobbox

#ve en que estado esta la vm
STATE=`sudo -H -b -u $VMUSER VBoxManage showvminfo $VMID| grep State| awk -F ' ' '{print $2} '`

#acciones
if [ $ACCION = "start" ] ; then
	case "$STATE" in
		running)
		echo "esta encendida la VM $VMNAME"
		echo "$STATE - $VMNAME - $FECHA01" >> $FILE
		;;
		paused)
		echo "esta pausada, reviviendo la VM $VMNAME"
		echo "$STATE - $VMNAME - $FECHA01" >> $FILE		
		sudo -H -b -u $VMUSER VBoxManage controlvm $VMID resume
		;;
		powered)
		echo "apagada, prendiendo ls VM $VMNAME"	
		echo "$STATE - $VMNAME - $FECHA01" >> $FILE	
		sudo -H -b -u $VMUSER VBoxManage startvm "$VMID" --type headless
		;;
		saved)
		echo "guardada, prendiendo ls VM $VMNAME"
		echo "$STATE - $VMNAME - $FECHA01" >> $FILE		
		sudo -H -b -u $VMUSER VBoxManage startvm "$VMID" --type headless
		;;
		*) 
		echo "La señal $STATE no existe"
		echo "La señal $STATE no existe - $VMNAME - $FECHA01" >> $FILE
		;;
	esac
fi

if [ $ACCION = "save" ] ; then
	case "$STATE" in
		running)
		echo "esta encendida la VM $VMNAME"
		echo "$STATE - $VMNAME - $FECHA01" >> $FILE		
		sudo -H -b -u $VMUSER VBoxManage controlvm "$VMID" savestate
		;;
		paused)
		echo "esta pausada, reviviendo la VM $VMNAME"		
		echo "$STATE - $VMNAME - $FECHA01" >> $FILE
		sudo -H -b -u $VMUSER VBoxManage controlvm $VMID resume
		echo "esta encendida la VM $VMNAME, guardando estado"		
		sudo -H -b -u $VMUSER VBoxManage controlvm "$VMID" savestate
		;;
		powered)
		echo "esta apagada la VM $VMNAME, no se hace nada"
		echo "$STATE - $VMNAME - $FECHA01" >> $FILE		
		;;
		saved)
		echo "esta guardada la VM $VMNAME, no se hace nada"
		echo "$STATE - $VMNAME - $FECHA01" >> $FILE		
		;;
		*)
		echo "La señal $STATE no existe"
		echo "La señal $STATE no existe - $VMNAME - $FECHA01" >> $FILE	
		;;
	esac
fi

if [ $ACCION = "stop" ] ; then
	case "$STATE" in
		running)
		echo "esta encendida la VM $VMNAME, apagando"
		echo "$STATE - $VMNAME - $FECHA01" >> $FILE		
		sudo -H -b -u $VMUSER VBoxManage controlvm "$VMID" poweroff
		;;
		paused)
		echo "esta en pausa la VM $VMNAME, apagando"		
		echo "$STATE - $VMNAME - $FECHA01" >> $FILE
		sudo -H -b -u $VMUSER VBoxManage controlvm $VMID poweroff
		;;
		powered)
		echo "esta apagada la VM $VMNAME, no se hace nada"
		echo "$STATE - $VMNAME - $FECHA01" >> $FILE		
		;;
		saved)
		echo "esta guardada la VM $VMNAME, se revive"
		echo "$STATE - $VMNAME - $FECHA01" >> $FILE
		sudo -H -b -u $VMUSER VBoxManage startvm "$VMID" --type headless
		sleep 3		
		echo "la VM $VMNAME encendida, apagando"
		sudo -H -b -u $VMUSER VBoxManage controlvm $VMID poweroff		
		;;
		*)
		echo "La señal $STATE no existe"
		echo "La señal $STATE no existe - $VMNAME - $FECHA01" >> $FILE		
		;;
	esac
fi

exit 0
