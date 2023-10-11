#!/usr/bin/env python3

import sys

if len(sys.argv) !=3:
    exit(1)
else:
    source = str(sys.argv[1])
    dest = str(sys.argv[2])

with open(source, 'r') as opensource:
    lines = opensource.readlines()
    reverse = reversed(lines)

with open(dest, 'w') as open_dest:
    open_dest.writelines(reverse)
