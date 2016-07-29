file_ja = File.open("train.vi-ja.ja", "r") 
file_vi = File.open("train.vi-ja.vi", "r")

out_ja = File.open("train.join.ja", "w")
out_vi = File.open("train.join.vi", "w")

block_vi = String.new
block_ja = String.new


def is_upcase word
	if word <= 'Z' && word >= 'A'
		return true
	else
		return false
	end
end

file_ja.each_line.zip(file_vi.each_line).each{ |line_ja, line_vi|
	if line_vi == "\n"
		out_ja.print "\n"
		out_vi.print "\n"
	elsif is_upcase(line_vi[0])
		out_ja.print "\n"
		out_vi.print "\n"
		out_ja.print line_ja.chomp
		out_vi.print line_vi.chomp 
	else
		out_ja.print line_ja.chomp
		out_vi.print ( " " + line_vi.chomp )
	end
}






# check corpus
# gui input output + 3 file .out + script + file final.gz
# tim hieu cach craw data tren cac trang web co gui
