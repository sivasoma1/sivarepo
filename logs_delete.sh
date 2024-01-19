#!/bin/bash

APP_LOGS_DIR=/home/centos/app_logs

DATE=$(date +%F:%H:%M:%S)
LOGSDIR=/home/centos/shellscript-logs
# /home/centos/shellscript-logs/script-name-date.log
SCRIPT_NAME=$0
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log

FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +14)

echo "script started executing at $DATE" &>>$LOGFILE

for file in FILES_TO_DELETE
do
    echo "Deleting $file" &>>$LOGFILE
    rm -rf $file
done 
