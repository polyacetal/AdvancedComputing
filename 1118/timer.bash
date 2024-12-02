#!/usr/bin/bash

minu=0
sec=0

if [ $# -eq 1 ]
then
	sec=$1
elif [ $# -eq 2 ]
then
	minu=$1
	sec=$2
fi

if [ $sec -gt 60 ]
then
	minu=$(($minu+$sec/60))
	sec=$(($sec%60))
fi

if [[ $# -gt 0 &&  $# -le 2 ]]
then
	while [[ $minu -gt 0 ||  $sec -gt 0 ]]
	do
		if [ $minu -eq 0 ]
		then
			echo -ne "\r$sec秒 "
		else
			echo -ne "\r$minu分$sec秒"
		fi
		sleep 1
		if [ $sec -eq 0 ]
		then
			minu=$(($minu-1))
			sec=60
		fi
		sec=$(($sec-1))
	done
	echo -ne "\r0秒 "
	sleep 1
	echo
fi
