#!/bin/bash
USERID=$(id -u)
log_dir=/home/centos/shellscript_logs
name=$0
log_file=$logdir/$name.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
Date=$(date +%F-%H-%M-%S)
if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR: : $N please run as a root user"
    exit 1

fi
validate(){
    if [ $1 -ne 0 ]
    then
        echo " installing..$2 $R is failure"
        exit 1
    else
        echo " installing.. $2 $G is sucess"
    fi
}
for i in $@

do
    yum install $i &>>$log_file
    if [ $? -ne 0 ]
    then 
        echo -e "$i is not installed,$G now installing wait...."
        yum install $i -y &>>$log_file
        validate $? "$i"
    else
        echo -e "$Y $i is already installed $N"
    fi
done