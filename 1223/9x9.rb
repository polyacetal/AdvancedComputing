#!/usr/bin/ruby

ary = (1..9).to_a

for i in ary
	for j in ary
		ans = i*j
		if ans <= 9 then
			print "  ", i*j
		else
			print " ", i*j
		end
	end
	print "\n"
end
