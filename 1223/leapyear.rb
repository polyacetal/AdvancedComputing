#!/usr/bin/ruby

for year in ARGV
	year = year.to_i
	if year % 400 == 0 then
		print year, "年は閏年です\n"
	elsif year % 100 == 0 then
		print year, "年は閏年ではありません\n"
	elsif year % 4 == 0 then
		print year, "年は閏年です\n"
	else 
		print year, "年は閏年ではありません\n"
	end
end
