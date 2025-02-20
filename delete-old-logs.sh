#!/bin/bash

source_folder=/home/ec2-user/logs

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ -d $source_folder ]
then
    echo -e " $source_folder $G exists $N "
else
    echo -e " $source_folder $R not exits $N "
    exit 1
fi 

log_files=$( find $source_folder -name "*.log" -mtime +14)
echo "Files: $log_files"

while IFS= read -r file
do
    echo "deleting file : $file"
    rm -rf $file
done <<< $log_files