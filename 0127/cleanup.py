#!/usr/bin/env python3

import os

def delete_target_file():
    pass

def search_target_file(curent_dir):
    process_file_path = os.listdir(curent_dir)
    print(process_file_path)
    for i in process_file_path:
        if os.path.isfile(i):
            print(f"file: {i}")
        else:
            print(f"dir: {i}")
            search_target_file(curent_dir+i+"/")
            print(i.isdigit())


def main():
    search_target_file("./")

if __name__ == "__main__":
    main()
