#!/bin/bash

while read F  ; do
        /usr/local/bin/aws  --region="sa-east-1" cloudformation delete-stack  --stack-name $F 
        echo "Deletando o arquivo ....." 
        echo $F
        done <stack-remover.txt
