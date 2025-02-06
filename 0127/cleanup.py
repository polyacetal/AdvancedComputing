#!/usr/bin/env python3

import os
import re
import shutil

year_pattern = re.compile(r'^(19\d{2}|20\d{2})$')
month_pattern = re.compile(r'^(\d{2}[A-Za-z]+)\.csv$')

for item in os.listdir("./"):
    item_path = os.path.join("./", item)

    if year_pattern.match(item) and os.path.isdir(item_path):
        print(f"{item} ... チェック")
        files = os.listdir(item_path)

        for file in files:
            if month_pattern.match(file):
                file_path = os.path.join(item_path, file)
                print(f"  {file} ... 削除")
                os.remove(file_path)
            else:
                print(f"  {item} ... 対象外")

        if not os.listdir(item_path):
            print(f"{item} ... 削除")
            shutil.rmtree(item_path)
        else:
            print(f"{item} ... スキップ")
    else:
        print(f"{item} ... 対象外")
