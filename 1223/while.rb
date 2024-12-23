#!/usr/bin/ruby

ary1 = (0..10).to_a
ary2 = Array.new

while first = ary1.shift
	print 'ary1: ', ary1.join(', '), "\n"
	ary2.unshift(first * 2)
	print 'ary2: ', ary2.join(', '), "\n"
	puts
end
