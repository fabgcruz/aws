#!/bin/bash
#
# Script delete Cloudformation stuck stacks
#
# Version: 1.0
#
# Author: Fabricio Goncalves
#
# email: fabgcruz@gmail.com
#
# Read  the README file before run this script.
# 
#
while read F  ; do
        /usr/local/bin/aws --region=[AWS REGION] cloudformation delete-stack  --stack-name $F
        echo "Deletando a  stack: "
        echo $F
        sleep 5
        done < stacks.txt

