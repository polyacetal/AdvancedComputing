#!/usr/bin/env python3

import os
import sys
import csv

def normalize(value, min_value, max_value, width=50):
    if value == "--" or value == "×":
        return " "
    try:
        value = float(value)
        scale = (value - min_value) / (max_value - min_value) if max_value != min_value else 0.5
        return "=" * int(scale * width)
    except ValueError:
        return " "

def plot_weather_graph(file_path, column_index):
    try:
        with open(file_path, "r", encoding="utf-8") as f:
            reader = csv.reader(f)
            header = next(reader)
            
            if column_index >= len(header):
                print(f"エラー: 指定された列インデックス {column_index} が範囲外です。")
                return

            data = [(row[0], row[column_index]) for row in reader if row]
            values = [float(row[1]) for row in data if row[1] not in ("--", "×")]
            
            if not values:
                print("エラー: 有効な数値データがありません。")
                return
            
            min_value, max_value = min(values), max(values)
            
            print(f"データファイル: {file_path} ({header[column_index]})")
            print(f"範囲: {min_value} ～ {max_value}")
            print()
            for date, value in data:
                print(f"{date} | {normalize(value, min_value, max_value)}")
    except FileNotFoundError:
        print(f"エラー: ファイル {file_path} が見つかりません。")
    except Exception as e:
        print(f"エラー: {e}")

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("使用法: python text_graph_weather.py ファイル名.csv 列インデックス")
        sys.exit(1)
    
    file_path = sys.argv[1]
    column_index = int(sys.argv[2])
    plot_weather_graph(file_path, column_index)

