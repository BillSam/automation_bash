#!/bin/bash

ps cax | grep apache2

if [ $? -eq 0 ]; then
        echo "Process is running."
else
        echo "Process is not running."

        echo "reiniciando service apache"
        service apache2 restart

        echo "enviando mail de aviso"
        /usr/bin/php5.6 /data/scripts/php/mail.php

fi
