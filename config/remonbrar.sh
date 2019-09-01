 #!/bin/bash
 ################################
 # renombrar.sh                 #
 # script renombramiento masivo #
 # numerando desde 1            #
 ################################
 cont=0
 nombre="vacaciones_"
 for picture in `ls *.jpg`
 do
 ((cont=$cont+1))
 nuevonombre=$nombre$cont
 echo "Renombrando... $picture"
 echo "a $nuevonombre.jpg"
 mv $picture $nuevonombre.jpg
 done
