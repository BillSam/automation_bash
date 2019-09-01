#!/bin/bash

PROCESS=$(pidof $1)

#echo $PROCESES

for PROSS in $PROCESS; do
        
sudo kill -9 $PROSS

done

