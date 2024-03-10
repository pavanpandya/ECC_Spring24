#!/usr/bin/env python3

import sys
import re
from datetime import datetime

pat = re.compile(r'(?P<ip>\d+\.\d+\.\d+\.\d+) .* \[(?P<timestamp>[^\]]+)\]')

for line in sys.stdin:
    match = pat.search(line.strip())
    
    if match:
        ip = match.group('ip')
        timestamp_str = match.group('timestamp').split()[0]
        
        try:
            timestamp = datetime.strptime(timestamp_str, "%d/%b/%Y:%H:%M:%S")
            hour = timestamp.strftime("%Y-%m-%d %H")
            print(f"{hour}\t{ip}\t1")
        
        except ValueError:
            pass
