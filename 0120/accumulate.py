#!/usr/bin/env python3

sum = 0

for i in range(1, 1001):
    if (i % 3 == 0) or (i % 17 == 0):
        sum += i
    if i % 31 == 0:
        sum -= i
    if (i % 3 == 0) and (i % 17 == 0):
        sum += i
        sum += (i/17)-(i/3)
print(sum)
