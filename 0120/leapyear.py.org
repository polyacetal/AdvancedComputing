#!/usr/bin/env python3

import sys

_, *argv = sys.argv
for year in argv:
    try:
        year = int(year)
        if year % 400 == 0:
            print(f"{year}年は閏年です")
        elif year % 100 == 0:
            print(f"{year}年は閏年ではありません")
        elif year % 4 == 0:
            print(f"{year}年は閏年です")
        else:
            print(f"{year}年は閏年ではありません")
    except:
        print("Error")
