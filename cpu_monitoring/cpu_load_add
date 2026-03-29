#!/bin/bash
# Generate ~20% CPU load on all cores

CPU_LOAD=20             # target CPU usage %
CORES=$(nproc)          # number of CPU cores
echo "Generating ~${CPU_LOAD}% CPU load on $CORES cores..."

# function to load CPU
load_cpu() {
    while true; do
        :          # busy loop
    done
}

# start one busy loop per core
for ((i=1;i<=CORES;i++)); do
    load_cpu &
done

# calculate sleep time to reduce CPU usage
SLEEP_TIME=$(echo "scale=2; (100-$CPU_LOAD)/$CPU_LOAD" | bc)

# control load by sleeping in main loop
while true; do
    sleep $SLEEP_TIME
done
