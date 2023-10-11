#!/usr/bin/env python3

import sys

if len(sys.argv) !=4:
    exit(1)
else:
    start = int(sys.argv[1])
    stop = int(sys.argv[2])
    filename = str(sys.argv[3])

with open(filename, 'w') as file:
    for line in range(start, stop + 1):
        file.write(str(line)+ "\n")
