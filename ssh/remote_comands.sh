#!/bin/bash

ssh -t user@172.1.1.101 "
sudo
some_command
sudo service
server_instance stop
sudo
some_other_command
"

