#!/usr/bin/awk -f

BEGIN{
	max=0;
	min=1000000;
}
/^[^ld]*$/ && NR >= 2 && max<$5{
	max=$5;
	maxName=$9;
}
/^[^ld]*$/ && NR >= 2 && max>$5{
	min=$5;
	minName=$9;
}
END {
	print "ファイル名 : ファイルサイズ";
	print maxName " : " max;
	print minName " : " min;
	}
