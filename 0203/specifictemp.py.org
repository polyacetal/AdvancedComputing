#!/usr/bin/env python3

import sys

_, *argv = sys.argv

def show(year, month, temp_dict):
    print(f"{year[0]}年{month[0]}月") if len(month) == 1 else print(f"{year[0]}年")
    for key, values in temp_dict.items():
        if len(key) < 3:
            print("  ", end='')
        print(f"  {key}: ", end='')
        if len(str(len(values))) == 1:
            print(f"  ",end='')
        elif len(str(len(values))) == 2:
            print(f" ",end='')
        print(f"{len(values)}日 (", end='')
        i = 0
        for value in values:
            if i != 0:
                print(", ", end='')
            print(value, end='')
            i += 1
        print(f")")

def main(target_file):
    year = []
    month = []
    temp_dict = {"猛暑日":[], "真夏日":[], "夏日":[], "冬日":[], "真冬日":[]}
    i = 0
    with open(target_file, 'r') as f:
        while True:
            line = f.readline()
            field = line.rstrip('\n').split(",")
            if not line:
                break
            if i != 0:
                date = field[0].split("/")
                year.append(date[0])
                month.append(date[1])
                max_temp = float(field[4])
                min_temp = float(field[5])
                if max_temp >= 35:
                    temp_dict["猛暑日"].append(date[1]+"/"+date[2])
                elif max_temp >= 30:
                    temp_dict["真夏日"].append(date[1]+"/"+date[2])
                elif max_temp >= 25:
                    temp_dict["夏日"].append(date[1]+"/"+date[2])
                elif max_temp < 0:
                    temp_dict["真冬日"].append(date[1]+"/"+date[2])
                elif min_temp < 0:
                    temp_dict["冬日"].append(date[1]+"/"+date[2])
            i += 1
    show(list(set(year)), list(set(month)), temp_dict)

if __name__ == '__main__':
    for target_file in argv:
        main(target_file)
