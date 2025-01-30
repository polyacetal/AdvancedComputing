#!/usr/bin/bash

files=*.bash
function checkShebang () {
	head -n 1 $1 | grep -q "^#!/usr/bin/bash"
}

for filename in $files
do
	echo -n "$filename : "
	if checkShebang $filename && [ -x $filename ]; then
		echo -n "OK "
	fi
	if [ ! -x $filename ]; then
		chmod +x $filename
		echo -n "実行を許可しました "
	fi
	if ! checkShebang $filename; then
		echo "#!/usr/bin/bash" | cat - $filename > tmpfile
		rm $filename
		mv tmpfile $filename
		echo -n "シェバンを追加しました "
	fi
	echo ""
done
