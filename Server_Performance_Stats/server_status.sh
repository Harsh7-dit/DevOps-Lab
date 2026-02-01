#!/bin/bash
top -bn1 | grep "%Cpu(s):" | cut -d ',' -f 4 | awk '{print "Total CPU Usage is : " 100-$1 "%"}'

echo ""

echo "Total Memory Usage :-"
free | grep "Mem:" -w | awk '{printf "Total: %.1fGi\nUsed: %.1fGi (%.2f%%)\nFree: %.1fGi (%.2f%%)\n",$2/1024^2, $3/1024^2, $3/$2 * 100, $4/1024^2, $4/$2 * 100}'

echo ""

echo "Total Disk Usage :-"
df -h | grep "/" -w | awk '{printf "Used: %s (%.2f%%)\nFree: %s (%.2f%%)\n",$3 + $4, $3, $3/($3+$4) * 100, $4, $4/($3+$4) * 100}'

echo ""

echo "Top 5 Processes by CPU Usage :-"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -6

echo ""

echo "Top 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -6
