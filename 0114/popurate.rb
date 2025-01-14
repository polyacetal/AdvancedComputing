#!/usr/bin/env ruby

all = 0
all04 = 0
all2024 = 0
open(ARGV[0]) do |file|
	file.each do |line|
		fields = line.chomp.split(",")
		if file.lineno == 1
			print fields[0], fields[1], "0歳~4歳", "20歳~24歳", "\n"
		elsif file.lineno == 2
			all = fields[1].to_f
			all04 = fields[2].to_f + fields[3].to_f + fields[4].to_f + fields[5].to_f + fields[6].to_f
			all2024 = fields[22].to_f + fields[23].to_f + fields[24].to_f + fields[25].to_f + fields[26].to_f
			print fields[0], " ", all.to_i, " ", all04.to_i, " ", all2024.to_i, "\n"
		elsif file.lineno >= 3
			area = fields[1].to_f
			area04 = fields[2].to_f + fields[3].to_f + fields[4].to_f + fields[5].to_f + fields[6].to_f
			area2024 = fields[22].to_f + fields[23].to_f + fields[24].to_f + fields[25].to_f + fields[26].to_f
			print fields[0], " ", area/all*100, "% ", area04/all04*100, "% ", area2024/all2024*100, "% ", "\n"
		end
	end
end
