#!/usr/bin/bash

i=1
suit=0
num=0
while [ $i -le 5 ]
do
	suit=$RANDOM
	num=$RANDOM
	suit=$(($suit%4))
	if [ $suit -eq 0 ]
	then
		suit="♠ "
	elif [ $suit -eq 1 ]
	then
		suit="♢ "
	elif [ $suit -eq 2 ]
	then
		suit="♡ "
	elif [ $suit -eq 3 ]
	then
		suit="♣ "
	fi
	num=$(($num%13+1))
	if [ $num -eq 1 ]
	then
		num="A"
	elif [ $num -eq 11 ]
	then
		num="J"
	elif [ $num -eq 12 ]
	then
		num="Q"
	elif [ $num -eq 13 ]
	then
		num="K"
	fi

	echo "$suit$num"
	i=$(($i+1))
done
