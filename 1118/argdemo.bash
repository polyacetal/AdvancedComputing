#!/usr/bin/bash

# argdemo.bash
# コマンドライン引数を使ったデモ

echo "コマンドライン引数は$#個です"

if [ $# -gt 0 ]
then
	echo "最初の引数は"
	echo $1
	echo "です"
else
	echo "何か引数を指定して下さい"
fi

count=0

for arg in $@
do
	count=$((count + 1))
	echo "$count番目の引数は"
	echo $arg
	echo "です"
done
