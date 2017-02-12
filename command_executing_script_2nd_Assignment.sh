#!/bin/bash

#taking command input from user
echo -n "Enter The command here > "
read cmd

#Logging to all server by user root considering password id and running command provided by user and printing the output.
for i in $(echo $@ | sed "s/,/ /g")
do
    echo "Command output for sever $i >>" ` ssh root@$i $cmd`
done

