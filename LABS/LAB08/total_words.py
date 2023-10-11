#!/usr/bin/env python3

import sys
import re

sysinput = sys.stdin.read()
words = re.findall(r'[a-zA-Z]+', sysinput)
count = len(words)

print(str(count) + " words")