#!/bin/bash

userid=$( id -u )

if [ $userid -ne 0 ]
then
    echo "u dont have root access,to go further u need root access"
    exit 1
else
    dnf list installed mysql # checks whether mysql installed or not 
    if [ $? -ne 0 ]
    then 
        dnf install mysql -y
        if [ $? -ne 0 ]
        then
            echo "ur facing issues while installing mysql"
            exit 1
        else
            echo " mysql succesfully got installed "
            exit 1
        fi
    else
        echo " mysql are already installed "
    fi
fi



        