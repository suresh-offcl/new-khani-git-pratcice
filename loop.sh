#!/bin/bash

userid=$( id -u )

check_root(){
    if [ $userid -ne 0 ]
    then
        echo "u dont have root access"
        exit 1
    fi
}


validate () {
    if [ $? -ne 0 ]
    then
        echo "ur facing problem while installing $package"
        exit 1
    else
        echo " $package installed "
    fi
}

check_root

for package in $@
do 
    dnf list installed $package
    if [ $? -ne 0 ]
    then 
        echo " $package is not installed , now installing it... "
        dnf install $package -y
        validate $? "installing $package"
    else
        echo " $package already installed "
    fi

done
