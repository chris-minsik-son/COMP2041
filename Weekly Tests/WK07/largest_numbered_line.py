#!/usr/bin/env python3

import sys
import re

max = 0
seen = {}

while True:
    try:
        line = input()
    except:
        break
    num = re.findall(r"\d+", line)
    for each in num:
        cur = int(each)
        if cur > max:
            max = cur
            seen = [line]
        elif cur == max:
            seen.append(line)

for each in seen:
    print(each)
