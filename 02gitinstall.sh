#!/bin/bash
 userid=$(id -u)
 if [ $userid -ne 0 ]
 then 
    echo "error:: please get the root access"
    exit 1
fi 

yum install git -y