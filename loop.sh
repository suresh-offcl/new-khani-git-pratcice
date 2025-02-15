#!/bin/bash
Log_folder="/var/log/shell-script"
script_name=$(echo $0 | cut -d "." -f1)
time_stamp=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE= "$Log_folder/$script_name-$time_stamp.log"
mkdir -p $Log_folder

userid=$( id -u )

g="e/[31m"
r="e/[32m"
n="e/[0m"
y="e/[33m"

check_root () {

    if [ $userid -ne 0 ]
    then
        echo " u dont have root access " |tee -a $LOG_FILE
    
    fi 
}

usage () {

    if [ $# -eq 0 ]
    then
        echo -e " kindly add packages with the file name " |tee -a $LOG_FILE
    fi
}

check_root

if [ $# -eq 0 ]
then 
    echo -e " kindly pass the arguments for packages "

validate () {

    if [ $? -ne 0 ]
    then
        echo -e "$r $package is failed $n" |tee -a $LOG_FILE
    else
        echo -e "$g $package is success $n" |tee -a $LOG_FILE
    fi 
}

for package in $@
do 
    dnf list installed $package 
    if [ $? -ne 0 ]
    then
        echo -e "$y $package is not installed, going to install it $n  " |tee -a $LOG_FILE
        dnf install $package -y |tee -a $LOG_FILE
        validate $? "installing $package"
    else
        echo -e "$g $package is already installed $n " |tee -a $LOG_FILE
    fi 
done
