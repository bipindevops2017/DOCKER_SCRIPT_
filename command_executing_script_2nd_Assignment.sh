#!/bin/bash

#taking command input from user
echo -n "Enter The command here > "
read cmd

#Logging to all server as provided by user while executing the script
for i in $(echo $@ | sed "s/,/ /g")
do
    echo "Command output for sever $i >>" ` ssh root@$i $cmd`
done

