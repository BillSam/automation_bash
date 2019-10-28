#!/bin/bash

DIR=$(ls)

for file in $DIR; do

echo "dir de trabajo $i"

if [ $file != repo_update.sh ]; then

  echo "me muevo al dir $file"
  cd $file

  echo "actualizo"
  git pull

  echo "salgo del dir"
  cd ..

fi

done


