#!/usr/bin/env python3

import sys
from operator import itemgetter

dict_ip_count = {}

for line in sys.stdin:
    line = line.strip()
    print("DEBUG:", repr(line)) 
    ip, num = line.split('\t')
    try:
        num = int(num)
        dict_ip_count[ip] = dict_ip_count.get(ip, 0) + num
    except ValueError:
        pass

sorted_dict_ip_count = sorted(dict_ip_count.items(), key=itemgetter(1), reverse=True)[:3]

print("Top 3 IP Addresses for whole duration")

for ip, count in sorted_dict_ip_count:
    print(f"{ip}\t{count}")
