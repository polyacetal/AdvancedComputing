#!/usr/bin/env python3

import sys
import os
import io

def write_file(table, separate_list, file_path):
    season = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    for i in range(12):
        target_season = str(i+1).zfill(2) + season[i]
        f = open(file_path+"/"+target_season+".csv", 'w')
        f.write(table+"\n")
        for feild in separate_list[i]:
            f.write(feild+"\n")
        f.close()


def separate(process_file):
    file_path = process_file.replace('.csv', '')
    separate_list = [[] for i in range(12)]
    table = ""
    i = 0
    j = 0

    f = open(process_file, 'r')
    print(f"{process_file} を分割")
    os.mkdir(file_path)
    while True:
        line = f.readline()
        field = line.rstrip('\n').split("/")
        if not line:
            break
        if i == 0:
            table = line.rstrip('\n')
        else:
            separate_list[int(field[1]) - 1].append(line.rstrip('\n'))

        i += 1
    f.close()
    write_file(table, separate_list, file_path)


def main():
    _, *argv = sys.argv
    for process_file in argv:
        separate(process_file)

if __name__ == "__main__":
    main()
