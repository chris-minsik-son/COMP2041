#!/usr/bin/env python3

import sys

inputs = sys.argv[1:]
count = 0

for file in inputs:
    with open(file, 'r') as openfile:
        for line in openfile:
            num = int(line.split()[1])
            if 'Orca' in line:
                count = count + num
            elif 'orca' in line:
                count = count + num

print(str(count) + " Orcas reported")