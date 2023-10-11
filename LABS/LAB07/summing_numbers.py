#!/usr/bin/env python3

import sys
import re

input = sys.argv[1]

count = 0

with open(input, 'r') as file:
    for line in file:
        list = re.findall(r"\d+", line)
        for num in list:
            count += int(num)
    print(count)
