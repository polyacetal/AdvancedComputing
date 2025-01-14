#!/usr/bin/env ruby

files = Dir.open('.').children

for file in files.sort do
	print file, " ", FileTest.size('./'+file), FileTest.directory?('./'+file)?" [ディレクトリ]":" ", "\n"
end
