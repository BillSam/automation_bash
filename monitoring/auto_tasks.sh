#!/bin/bash
# Ejemplo de script para automatizar tareas:
# -Actualizar la base de datos del archivo local:
echo -e "\e[4;32m ACTUALIZANDO LA BASE DE DATOS DEL ARCHIVO LOCAL \e[0m"
updatedb
if [ $? == 0 ]; then
    echo "La base de datos del archivo local se actualizó correctamente."
else
    echo "La base de datos del archivo local no se actualizó correctamente."
fi
echo ""

# -Encuentre y/o elimine archivos con permisos 777.
echo -e "\e[4;32m BUSCANDO ARCHIVOS CON 777 PERMISOS \e[0m"
# Habilite o modifique cualquiera de las opciones (comente en la otra línea), pero no todas.
# ######## ######## ########
# Opción 1: Simplemente cambiar los permisos de archivos ejecutables. 
chmod -c -x `find -type f -perm 0777`
# ######## ######## ########
# Opción 2: Eliminar archivos sin pedir confirmación. 
# ######## ######## ########
#find -type f -perm 0777 -delete
# ######## ######## ########
# Opción 2: Pedir confirmación antes de eliminar archivos. 
# ######## ######## ########
# find -type f -perm 0777 -exec rm -i {} +;
# ######## ######## ########
echo ""
# -Alertar cuando el uso del sistema de archivos supera un límite definido 
echo -e "\e[4;32m COMPROBACIÓN DEL USO DEL SISTEMA DE ARCHIVOS \e[0m"
UMBRAL=30
while read line; do
        # Esta variable almacena la ruta del sistema de archivos como una cadena
        FILESYSTEM=$(echo $line | awk '{print $1}')
        # Esta variable almacena el porcentaje de uso (XX%)
        PERCENTAGE=$(echo $line | awk '{print $5}')
        # Use el porcentaje sin el signo%.
        USAGE=${PERCENTAGE%?}
        if [ $USAGE -gt $UMBRAL ]; then
                echo "The remaining available space in $FILESYSTEM is critically low. Used: $PERCENTAGE"
        fi
done < <(df -h --total | grep -vi S.Ficheros)