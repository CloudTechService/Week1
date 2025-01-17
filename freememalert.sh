#!/bin/bash

total_memory=$(free | grep Mem: | awk '{print $2}')
free_memory=$(free | grep Mem: | awk '{print $4}')
free_memory_percentage=$((free_memory * 100 / total_memory))

log_file="/var/log/cronlogs/freememoryalert.log"
log_entry="[$(date '+%Y-%m-%d %H:%M:%S')] Free memory percentage: $free_memory_percentage%"


echo "$log_entry" >> "$log_file"


tail -n 5 "$log_file" > "$log_file.tmp" && mv "$log_file.tmp" "$log_file"


if [ "$free_memory_percentage" -lt 50 ]; then
  echo "Alert: Free memory is below 50% ($free_memory_percentage%)"
  

  subject="Memory Alert: Free memory below 50%"
  body="Warning: The free memory on your system is critically low. Current free memory percentage: $free_memory_percentage%."
  recipient="sajjan@cloudtechservice.com"  
  echo "$body" | mail -s "$subject" "$recipient"
else
  echo "System is healthy. Free memory is at $free_memory_percentage%"
fi

