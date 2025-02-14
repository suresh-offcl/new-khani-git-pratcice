#!/bin/bash
userid=$( id -u )
check_root(){
    if [ $userid -ne 0 ]
    then 
        echo "u  dont have root access"
        exit 1
    fi
}

validate () {
    if [ $? -ne 0 ]
    then 
        echo "facing issues while installing $2 pls check it once"
    else
        echo "succesfully installed $2"
    fi
}

check_root
dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "mysql is not installed , going to install it..."
    dnf install mysql -y
    validate $? "mysql"
    
else
    echo "already installed"
fi


