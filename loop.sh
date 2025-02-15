#!/bin/bash

userid=$( id -u )

check_root () {
    if [ $userid -ne 0 ]
    then 
        echo " you dont have root access  "
        exit 1
    fi
}

validate () {

    if[ $? -ne 0 ]
    then 
        echo " $package is not installed , ur facing some issues "
        exit 1
    else
        echo " $package is installed "

}

check_root

for package in $@
do 
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo " $package is not installed ,trying to install it"
        dnf install $package -y
        validate $? "installing $package"
    else
        echo " $packa ge is already installed "
    
    fi


done


