#!/usr/bin/env python3

import sys
import re

target = sys.argv[1]
modifytarget = target.lower()

sysinput = sys.stdin.read()
modifyinput = sysinput.lower()

words = re.findall(r'[a-zA-Z]+', modifyinput)

i = 0
for word in words:
    if word == modifytarget:
        i += 1

count = len(words)

print(str(modifytarget) + " occurred " + str(i) + " times")