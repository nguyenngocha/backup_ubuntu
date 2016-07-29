file_in = File.open("train.escape.ja", "r") 
file_out = File.open("train.tok.ja", "w")

flag = 1
file_in.each do |line|
  line.each_char do |word|
  	if word == "\n"
  		flag = 1
  	  file_out.print word
  	else 
  	  if flag == 1
  	  	file_out.print word
  	  	flag =0
  	  else
  	  	file_out.print( " " + word )
  	  end
  	end
  end
end

file_out.close