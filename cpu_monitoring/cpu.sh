#!/bin/bash

#$8 is basically i

top -bn1 | awk 'NR==3 {usage=100-$8; printf "Cpu usage is : %.0f%%\n", usage}'
