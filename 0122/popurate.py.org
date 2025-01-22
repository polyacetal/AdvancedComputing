#!/usr/bin/env python3

import sys
import io

_, *argv = sys.argv
f = open(argv[0], 'r')

i = 0
all_age = 0
all04 = 0
all2024 = 0
while True:
    line = f.readline()
    field = line.rstrip('\n').split(",")
    if not line:
        break
    if i == 0:
        print(f"{field[0]} {field[1]} 0~4歳 20~24歳")
    elif i == 1:
        all_age = int(field[1])
        all04 = int(field[2]) + int(field[3]) + int(field[4]) + int(field[5]) + int(field[6])
        all2024 = int(field[22]) + int(field[23]) + int(field[24]) + int(field[25]) + int(field[26])
        print(f"{field[0]} {all_age} {all04} {all2024}")
    else:
        area = int(field[1])
        area04 = int(field[2]) + int(field[3]) + int(field[4]) + int(field[5]) + int(field[6])
        area2024 = int(field[22]) + int(field[23]) + int(field[24]) + int(field[25]) + int(field[26])
        print(f"{field[0]} {area/all_age*100}% {area04/all04*100}% {area2024/all2024*100}%")
    i += 1

f.close()
