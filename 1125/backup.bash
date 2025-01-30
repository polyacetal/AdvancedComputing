#!/usr/bin/bash

for file in "$@"; do
    if [ ! -e "$file" ]; then
        echo "$file なんてファイルはありません"
				continue
    fi

    backup_file="$file.back"
    old_backup_file="$file.back.old"

    if [ -e "$backup_file" ]; then
        echo "$backup_file -> $old_backup_file"
        mv -f "$backup_file" "$old_backup_file"
    fi

    echo "$file -> $backup_file"
    cp "$file" "$backup_file"
done
