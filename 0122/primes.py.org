#!/usr/bin/env python3

import sys

_, *argv = sys.argv
prime = []
natural = list(range(2, int(argv[0])+1))
while len(natural) != 0:
    num = natural.pop(0)
    prime.append(num)
    natural = [n for n in natural if n % num != 0]

print(prime)
