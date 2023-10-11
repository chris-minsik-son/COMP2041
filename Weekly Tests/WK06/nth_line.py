#!/usr/bin/env python3

import sys

if len(sys.argv) !=3:
    exit(1)
else:
    n = int(sys.argv[1])
    filename = str(sys.argv[2])

with open(filename, 'r') as file:
    lines = file.readlines()
    count = len(lines)
    if n > count:
        exit(1)
    else:
        print(lines[n-1].strip())