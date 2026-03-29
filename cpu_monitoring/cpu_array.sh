#!/bin/bash

top -bn1 | awk -F',' '/Cpu/ {
    for(i=1;i<=NF;i++){
        if($i ~ /id/){
            split($i,a," "); 
            usage=100-a[1]; 
            printf "CPU Usage : %.0f%%\n", usage
        }
    }
}'
