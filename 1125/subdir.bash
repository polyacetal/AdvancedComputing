#!/usr/bin/bash

files=*

for filename in $files
do
	if [ -d $filename ]; then
		echo $filename
	fi
done
