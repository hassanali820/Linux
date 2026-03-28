#!/bin/bash


free -h | awk 'NR==2 { usage = ($2-$7) / $2 * 100; printf "Memory Usage is : %.0f%%\n", usage}'
