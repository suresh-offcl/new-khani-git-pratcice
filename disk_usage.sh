#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5
SUM=0
while IFS= read -r line
do 
    USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
    #PARITION=$(echo $line | grep xfs | awk -F " " '{PRINT $NF}')
    PARTITION=$(echo $line | grep xfs | awk -F " " '{print $NF}')

    echo "$PARITION"
    
done <<< $DISK_USAGE

