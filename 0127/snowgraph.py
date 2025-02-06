#!/usr/bin/env python3

import os
import sys

def normalize(value, min_value, max_value, width):
    if value == "--":
        return " (0.0)"
    value = float(value)
    scale = value / max_value if max_value != min_value else 0.5
    return "=" * int(scale * width) + " (" + str(round(value,1)) + ")"

def plot_graph(date, data):
    year = []
    month = []

    max_value = max(data)
    min_value = min(data)
    offset = len(date[len(date)-1]) + 1

    for item in date:
        year.append(item.split("/")[0])
        month.append(item.split("/")[1])
    year = list(set(year))
    month = list(set(month))
    if len(month) == 1:
        print(f"{year[0]}年{month[0]}月 最深積雪(cm)")
    else:
        print(f"{year[0]}年 最深積雪(cm)")

    print(" "*offset+"0.0"+" "*22+str(max_value/2)+" "*(25-len(str(max_value/2)))+str(max_value))
    print(" "*offset+"+"+"-"*24+"+"+"-"*24+"+")
    for i in range(len(date)):
        day = date[i].split("/")[2]
        if len(day) == 1:
            print(f"{date[i]}  |{normalize(data[i], min_value, max_value, 50)}")
        else:
            print(f"{date[i]} |{normalize(data[i], min_value, max_value, 50)}")
    print(" "*offset+"+"+"-"*24+"+"+"-"*24+"+")
    print(" "*offset+"0.0"+" "*22+str(max_value/2)+" "*(25-len(str(max_value/2)))+str(max_value))

def main(file_path):
    data = []
    date = []
    i = 0
    with open(file_path, 'r') as f:
        while True:
            line = f.readline()
            field = line.rstrip('\n').split(",")
            if not line:
                break
            if i != 0:
                date.append(field[0])
                data.append(float(field[9]) if field[9] != "--" else 0.0)
            i += 1
        plot_graph(date, data)

if __name__ == '__main__':
    _, *argv = sys.argv
    main(argv[0])
