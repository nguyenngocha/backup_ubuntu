class Block
	attr_reader :lines, :block_vi, :block_ja
	def initialize(block_vi, block_ja)
		@block_ja = block_ja
		@block_vi = block_vi
		@lines = block_vi.count("\n")
	end
	def lines
		@lines
	end
	def block_vi
		@block_vi
	end

	def block_ja
		@block_ja
	end
end

collect = Array.new
f_ja = File.open("out.ja", "r") 
f_vi = File.open("out.vi", "r")

b_ja = String.new
b_vi = String.new
flag = 0
f_ja.each.zip( f_vi.each).each { |l_ja, l_vi|
	if((l_vi != "\n" && flag == 1)||l_vi.chomp.empty?)
		block = Block.new(b_vi,b_ja)
		collect << block
		flag = 0; b_ja = l_ja; b_vi = l_vi
	elsif(l_vi == "\n")
		flag = 1
		b_ja += l_ja
		b_vi += l_vi
	else
		b_ja += l_ja
		b_vi += l_vi
	end
}

total = 0
block_ja = String.new
block_vi = String.new
until total >= 600
	flag = rand(collect.count)
	total += collect[flag].lines
	block_ja += collect[flag].block_ja + "\n"
	block_vi += collect[flag].block_vi + "\n"
	collect.delete(collect[flag])
end

File.open("600.word.s1.ja", "w"){|file| file.write(block_ja)}
File.open("600.word.s1.vi", "w"){|file| file.write(block_vi)}

total = 0
block_ja = String.new
block_vi = String.new
until total >= 600
	flag = rand(collect.count)
	total += collect[flag].lines
	block_ja += collect[flag].block_ja + "\n"
	block_vi += collect[flag].block_vi + "\n"
	collect.delete(collect[flag])
end

File.open("600.word.s2.ja", "w"){|file| file.write(block_ja)}
File.open("600.word.s2.vi", "w"){|file| file.write(block_vi)}

block_ja = String.new
block_vi = String.new

collect.each do |block| 
	block_vi += block.block_vi
	block_ja += block.block_ja
end

File.open("word.s3.ja", "w"){|file| file.write(block_ja)}
File.open("word.s3.vi", "w"){|file| file.write(block_vi)}
