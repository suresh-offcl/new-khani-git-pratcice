#!/bin/bash

log_file="/var/log/shell-practice-script"
script_name=$( echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
log_folder="$log_file/$script_name-$time_stamp.log"
mkdir -p $log_folder

userid=$( id -u )

G="e/[32m"
R="e/[31m"
Y="e/[33m"
N="e/[0m"

check_root () {

    if [ $? -ne 0 ]
    then
        echo "ur not having root access" | tee -a $log_folder
        exit
    fi 
}



usage () {
    echo " u dont have parameters, pls add packages names ,u want to install it " | tee -a $log_folder
    exit 1
   
}

check_root
if [ $# -eq 0 ]
then 
    usage
fi 

validate () {

    if [ $? -ne 0]
    then
        echo -e "$R $package is not installed, ur facing issues while installing $package $N"
    else
    echo "package is already installed"
    fi 
}


for package in $@
do
    dnf list installed $package 
    if [ $? -ne 0 ]
    then 
        echo -e "$G $package is not installed , going to install $package $N"
        dnf install $package -y
        validate $? "installing $package"
        
    else
    echo -e "$G $package is already installed .nothing to do $N"

    fi 
done 

