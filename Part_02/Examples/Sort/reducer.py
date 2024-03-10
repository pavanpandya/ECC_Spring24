#!/usr/bin/env python

import sys

# Read lines from standard input
lines = sys.stdin.readlines()

# Perform sort
lines.sort()

# Print Output
for line in lines:
    line = line.strip()
    print(line.split("\t")[0])

