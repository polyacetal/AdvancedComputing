#!/usr/bin/bash

files=*

echo "書き込み許可のないファイル"
for filename in $files
do
	if [ ! -w $filename ]; then
		echo $filename
	fi
done
