#!/usr/bin/env python3

import sys
import re

_, *argv = sys.argv
for address in argv:
    match = re.search(r'\w+@[\w.-]+\.[\w-]+', address)
    if match:
        print(f"OK {address}")
    else:
        print(f"NG {address}")

