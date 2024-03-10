#!/usr/bin/env python3

import sys

for line in sys.stdin:
    # Remove leading and trailing whitespace and split lines into words
    words = line.strip().split()
    
    for word in words:
        print(f'{word}\t1')
        
