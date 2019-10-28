#!/bin/bash

DIR=$(ls)

for file in $DIR; do

echo "dir de trabajo $i"

if [ $file != repo_update.sh ]; then

  echo "me muevo al dir $file"
  cd $file

  echo "agrego todo"
  git add --all 

  echo "comite all"
  git commit -m "update"

  echo "actualizando up"
  git push origin master
  
  echo "salgo del dir"
  cd ..

fi

done


