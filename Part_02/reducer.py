#!/usr/bin/env python3

import sys
from collections import defaultdict
from operator import itemgetter

# Taking input from the terminal
hourly_ip_count = defaultdict(int)
start_hour, end_hour = map(int, sys.argv[1].split('-'))

for line in sys.stdin:
    line = line.strip()
    hour, ip, count = line.split('\t', 2)
    count = int(count)
    hour_int = int(hour[-2:])
    
    if start_hour <= hour_int < end_hour:
        hourly_ip_count[ip] += count

# Sorting IP addresses based on their counts
sorted_ips = sorted(hourly_ip_count.items(), key=itemgetter(1), reverse=True)

# Output the top-3 IP addresses
top_3_ips = sorted_ips[:3]
    
for ip, count in top_3_ips:
    print(f"from {start_hour:00}:00:00 to {(end_hour-1):02}:59:59: IP: {ip}, Count: {count}")
