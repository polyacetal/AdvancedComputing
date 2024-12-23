#!/usr/bin/ruby

for address in ARGV
	check = /\w+@[\w.-]+\.[\w-]+/ =~ address
	if check == 0 then
		print "OK ", address, "\n"
	else
		print "NG ", address, "\n"
	end
end
