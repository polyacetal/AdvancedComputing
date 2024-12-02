#!/usr/bin/bash
i=1
j=1
while [ $i -le 9 ]
do
	j=1
	while [ $j -le 9 ]
	do
		if [ $(($i * $j)) -le 9 ]
		then
			echo -n " "
		fi
		echo -n "$(($i * $j)) "
		j=$((j+1))
	done
	i=$((i+1))
	echo
done
