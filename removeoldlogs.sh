#!/bin/bash

log_dir="/var/log/"

old_logs=$(find "$log_dir" -type f -mtime +7 \( -name "*.log" \) -o \( -name "*.log.*" \) )

if [ -n "$old_logs" ]; then

find "$log_dir" -type f -mtime +7 \( -name "*.log" \) -o \( -name "*.log.*" \) -exec rm -f {} \;


 echo "Old log files more than 7 days have been removed from $log_dir"

else
        echo "no log files older than 7 days"

fi
