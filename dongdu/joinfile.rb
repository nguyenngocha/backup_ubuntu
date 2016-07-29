file_ja = File.open("train.vi-ja.ja", "r") 
file_vi = File.open("train.vi-ja.vi", "r")

out_ja = File.open("out.ja", "w")
out_vi = File.open("out.vi", "w")

block_vi = String.new
block_ja = String.new

file_ja.each.zip(file_vi.each).each{ |line_ja, line_vi|
	if line_vi.to_s.include? "."
		out_ja.puts(line_ja)
		out_vi.puts(line_vi)
	elsif line_vi.to_s.chomp.empty?
		out_vi.puts(line_vi)
		out_ja.puts(line_vi)
	else 
		out_ja.print(line_ja.to_s.chomp + " ")
		out_vi.print(line_vi.to_s.chomp + " ")
	end
}

# check corpus
# gui input output + 3 file .out + script + file final.gz
# tim hieu cach craw data tren cac trang web co gui
