#!/bin/bash

output_dir="./cron"

find "$output_dir" -type f -name "*.csv" -mtime +30 -exec rm -f {} \;

echo "Files older than 30 days have been removed from $output_dir"

