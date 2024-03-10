#!/usr/bin/env python3

import sys

# Get the pattern to search for from command line argument
pattern = sys.argv[1]

for line in sys.stdin:
    line = line.strip()
    if pattern in line:
        print(f"{line}\t{1}")
