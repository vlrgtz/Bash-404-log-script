#!/bin/bash

# File name of the log file
LOG_FILE="web-server-access-logs.log"

# Check if the log file exists
if [[ ! -f "$LOG_FILE" ]]; then
  echo "Log file not found!"
  exit 1
fi

# Extract IP addresses with "404" errors and count occurrences
grep "404" "$LOG_FILE" | awk '{print $1}' | sort | uniq -c | sort -nr > ip_404_report.txt

# Display the report
echo "IP addresses with 404 errors and their occurrences:"
cat ip_404_report.txt
