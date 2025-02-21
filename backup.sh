#!/bin/bash
source_dir=$1
destination_dir=$2
days=$(3:-14)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

usage () {
    echo -e "$R usage :: $N  filename <source_folder> <destination_folder> <time-optional>"
}

if [ $# -lt 2 ]
then
    usage
    exit1
fi 

if [ ! -d $source_dir ]
then 
    echo "$source_dir does not exist .. pls check"
fi 

if [ ! -d $destination_dir ]
then 
    echo "$destination_dir does not exist .. pls check"
fi 



files=$( find /home/ec2-user/logs -name "*.log" -mtime +14 )
echo "files : $files"

if [ ! -z $files ]
then
    echo -e " files found  "
else
    echo "no files are older than $days"
fi