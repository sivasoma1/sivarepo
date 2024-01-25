#!/bin/bash

APP_LOGS_DIR=/home/centos/app_logs

DATE=$(date +%F:%H:%M:%S)
LOGS_deleted_DIR=/home/centos/shellscript-logs
# /home/centos/shellscript-logs/script-name-date.log
SCRIPT_NAME=$0
LOGFILE=$LOGS_deleted_DIR/$SCRIPT_NAME-$DATE.log

FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -mtime +14 -exec=rm {} \)

echo "script started executing at $DATE" &>>$LOGFILE

for file in FILES_TO_DELETE
do
    echo "Deleting $FILES_TO_DELETE" &>>$LOGFILE
    rm -rf $FILES_TO_DELETE
done 

