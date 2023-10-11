#!/usr/bin/env python3

import sys

input = sys.argv[1:]
unique = {}

for each in input:
    if each not in unique:
        unique[each] = True

print(' '.join(unique.keys()))
