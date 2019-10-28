#!/bin/bash

DIR=$(pwd)

LIST=$(cat $DIR/lista.txt)

REGISTRY="123.176.93.6:5000"

for IMAGE in $LIST
do

        echo "Imagen $IMAGE"
        IMAGE=$IMAGE
        echo "Descargando Imagen $IMAGE"
        docker pull $IMAGE
        echo "Tageando Imagen $IMAGE"
        docker tag $IMAGE $REGISTRY/$IMAGE
        echo "Enviando Imagen $IMAGE"
        docker push $REGISTRY/$IMAGE
        echo "Borrando tag Imagen $IMAGE"
        docker rmi $REGISTRY/$IMAGE
        echo "Borrando Imagen $IMAGE"
        docker rmi $IMAGE

done