#!/bin/bash

active_users=$(who | awk '{print $1}' | sort | uniq)

timestamp=$(date "+%Y-%m-%d %H:%M:%S")

report_file="/home/vagrant/active_users.txt"

{
        echo "active users report -$timestamp"
        echo "______________________________"
        echo "$active_users"
} > "$report_file"

cat "$report_file"

echo "active users is shown in this report: $report_file"
