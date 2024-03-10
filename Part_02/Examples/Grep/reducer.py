#!/usr/bin/env python3

from operator import itemgetter
import sys

for line in sys.stdin:
    line = line.strip()
    word, count = line.split('\t', 1)
    print(f"{word}")
