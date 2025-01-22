#!/usr/bin/env python3

array = range(1, 10)

for i in array:
    for j in array:
        ans = i*j
        if ans <= 9:
            print(" ", i*j, end="")
        else:
            print("", i*j, end="")
    print("")
