#!/bin/bash

LOCAL='/data/backups/remote_mysql'
REMOTE='//10.1.1.1/server'
USER='username=user,password=pass,domain=server'

mount -t cifs $REMOTE $LOCAL -o $USER
