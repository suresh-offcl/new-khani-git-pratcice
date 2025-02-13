#!/bin/bash
userid=$( id -u )

if [ $userid -ne 0 ]
then
    echo " dont have root access,pls get access to do anything"
    exit 1
else
    dnf list installed mysql
    if [ $? -eq 0 ]
    then
        echo " mysql is already installed"
        exit 1
    else
        dnf install mysql -y
        dnf list installed mysql
        if [ $? -eq 0 ]
        then
            echo " mysql is succesfully installed"
            exit 1
        else
            echo " mysql is not installed , facing problem to install"
            exit 1
        fi
    fi
fi

