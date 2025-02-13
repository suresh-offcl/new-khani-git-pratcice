#!/bin/bash
userid=$( id -u )
if [ $userid -eq 0 ]
then
    dnf list installed mysql
    if [ $? -eq 0 ]
    then
        echo "mysql are already installed"
        exit 1
    else
        dnf install mysql -y
        dnf list installed mysql
        if [ $? -eq 0 ]
        then 
            echo "mysql is installed"
            exit 1
        else
            echo "mysql is not installing facing some issues"
            exit 1
        fi
    fi
fi



