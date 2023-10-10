#!/bin/bash

# DO NOT run this script directly.
# Use only main.sh

OUTPUT_CSV="output.csv"
OUTPUT_DELAY="1s"


rm $OUTPUT_CSV

echo "Time Stamp, Memory usage" >> $OUTPUT_CSV

while true
do  
    current_time=$(date)
    mem_utilization=$(free -t | awk 'NR == 2 {printf("%.2f%"), $3/$2*100}')

    echo "$current_time,$mem_utilization" >> $OUTPUT_CSV
    sleep $OUTPUT_DELAY
done





