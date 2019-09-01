#!/bin/bash

#renombrar archivos
 cont=0
 nombre="vacaciones_"
 for FILE in `ls *.*`
 do
 ((cont=$cont+1))
 nuevonombre=$nombre$cont
 echo "Renombrando... $picture"
 echo "a $nuevonombre.jpg"
 mv $picture $nuevonombre.jpg
 done


#levantar lista de archivos
FILE=`ls`

#muesra como quedarian desde linea de comandos
FILE=`ls`;for FILE in * ; do NEWFILE=`echo $FILE | sed 's/ /_/g'` ; echo "$FILE will be renamed as $NEWFILE" ; done


#los camvierte desde linea de comandos
FILE=`ls`; for FILE in * ; do NEWFILE=`echo $FILE | sed 's/^maths_//'` ; mv $FILE $NEWFILE ; done


