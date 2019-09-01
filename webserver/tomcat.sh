#! /bin/sh
# Script ejemplo para arranque de servicios en /etc/init.d/
#

case "$1" in
start)
echo "Iniciando servicio... "
/opt/tomcat/bin/startup.sh
# Aquí comando a ejecutar para arrancar el servicio
;;
stop)
echo "Deteniendo servicio..."
/opt/tomcat/bin/startup.sh
# Aquí comando a ejecutar para detener el servicio
;;
*)
echo "Modo de empleo: /etc/init.d/tomcat {start|stop}"
exit 1
;;
esac
exit 0
