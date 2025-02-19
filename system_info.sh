#!/bin/bash
# This script displays system information

echo "=== System Information ==="
echo "Date and Time: $(date)"
echo "Uptime: $(uptime -p)"
echo "Logged-in Users:"
who
