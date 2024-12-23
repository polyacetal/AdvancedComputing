#!/usr/bin/ruby

for num in ARGV
	prime = Array.new
	natural = (2..num.to_i).to_a

	loop do
		if natural.empty? then
			for i in prime
				print i, " "
			end
			print "\n"
			break
		end

		buff = natural[0]
		prime.append(buff)
		for i in natural
			if i % buff == 0 then
				natural.delete(i)
			end
		end
	end
end
