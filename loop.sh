#!/bin/bash

userid=$( id -u )

g="/e[31m"
r="/e[32m"
n="/e[0m"

check_root () {

    if [ $userid -ne 0 ]
    then 
        echo " $g U dont have root access "
        exit 1
    fi

}

validate () {

    if [ $1 -ne 0 ]
    then 
        echo "$r $package is not installed facing somr issues $n "
        exit 1
    else
        echo "$g $package is installed "
    fi

}

check_root

for package in $@ 
do
    dnf list installed $package
    if [ $? -eq 0 ]
    then
        echo " $package is already $g installed $n "

    else
        dnf install $package -y
        validate $? " installing $package "

    fi 
done 
