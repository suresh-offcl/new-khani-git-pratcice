#!/bin/bash
username=$name
userid=$( id -u )

if [ $userid -ne 0 ]
then
    echo "$username dont have root access,pls get access to do anything"
    exit 1
else
    dnf list installed git
    if [ $? -eq 0]
    then
        echo " $username ,git is already installed"
        exit 1
    else
        dnf install git -y
        dnf list installed git
        if [ $? -eq 0 ]
        then
            echo "$username , git is succesfully installed"
            exit 1
        else
            echo "$username , git is not installed , facing problem to install"
            exit 1
        fi
    fi
fi

