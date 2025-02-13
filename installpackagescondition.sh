#!/bin/bash

userid=$( id -u )

if [ $userid -ne 0 ]
then
    echo "ur not a administator user, kindly pls contact him to get root access"
    exit 1
fi

dnf list installed git

if [ $? -eq 0 ]
then
    echo " package is already installed pls check it "
else
    echo "package is not installed , installing now"
    dnf install git -y
fi
