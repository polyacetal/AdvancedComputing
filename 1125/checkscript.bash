#!/usr/bin/bash

files=*.bash
cp $# tmpfile
mv tmpfile $#
function checkShebang () {
	aa
	$1
	if then
	fi
	return 1
}

function executable () {
	hoge
}

for filename in $files
do
	echo -n "$filename : "
	if checkShebang $filename && executable $filename; then
		echo -n "OK "
	fi
	if ! executalbe $filename; then
		echo -n "実行を許可しました "
	fi
	if ! checkShebang $filename; then
		echo -n "シェバンを追加しました "
	fi
	echo ""
done
