#!/usr/bin/env python3

import sys

n = int(sys.argv[1])
seen = {}

while True:
    try:
        line = input()
    except:
        break
    
    if line in seen:
        seen[line] += 1
    else:
        seen[line] = 1
    
    if seen[line] == n:
        print("Snap: " + str(line))
        break
