#!/bin/bash
source_dir=$1
destination_dir=$2
days=${3:-14}
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

usage () {
    echo -e "$R usage :: $N sh  filename.extension <source_folder> <destination_folder> <time-optional>"
}

if [ $# -lt 2 ]
then
    usage
    exit 1
fi 

if [ ! -d $source_dir ]
then 
    echo "$source_dir does not exist .. pls check"
fi 

if [ ! -d $destination_dir ]
then 
    echo "$destination_dir does not exist .. pls check"
fi 



files=$( find $source_dir -name "*.log" -mtime +$days )
echo "files : $files"

if [ ! -z $files ]
then
    echo -e " files found  "
else
    echo "no files are older than $days"
fi