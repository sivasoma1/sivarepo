#!/bin/bash
 userid=$(id -u)
 if [ $userid -ne 0 ]
 then 
    echo "error:: please get the root access"
    exit 1
fi 

yum install git -y
yum install mysql -y

if [ $? -ne 0 ]
then 
    echo "Error::your installation got error"
    exit 1
else
    echo "installing"
fi