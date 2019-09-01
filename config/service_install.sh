SERVER=$1
USER=$2
SERVICE=$3
SO=$4

#echo "instalar repos epel"
#ssh -i id_rsa $USER@$SERVER sudo yum install -y epel-release


if [ "$SO" == "centos"];then 
	echo "instalando servicio $SERVICE"
	ssh -i id_rsa $USER@$SERVER sudo yum -y install $SERVICE

	echo "activar inicio automatico"
	ssh -i id_rsa $USER@$SERVER sudo systemctl enable $SERVICE

	echo "activar servicio"
	ssh -i id_rsa $USER@$SERVER sudo systemctl start $SERVICE
fi

if [ "$SO" == "ubuntu"];then 
	echo "instalando servicio $SERVICE"
	ssh -i id_rsa $USER@$SERVER sudo apt-get -y install $SERVICE

	echo "activar inicio automatico"
	ssh -i id_rsa $USER@$SERVER sudo systemctl enable $SERVICE

	echo "activar servicio"
	ssh -i id_rsa $USER@$SERVER sudo systemctl start $SERVICE
fi