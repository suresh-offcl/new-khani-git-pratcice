#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=5
SUM=0
while IFS= read -r line
do 
    USAGE=$(echo $line | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
    SUM=$SUM+$USAGE
    echo "$SUM $USAGE "
    
done <<< $DISK_USAGE

