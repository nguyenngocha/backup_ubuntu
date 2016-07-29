file_in = File.open(ARGV[0], "r") 
file_out = File.open(ARGV[1], "w")

flag = 1
file_in.each do |line|
  line.each_char do |word|
  	if word == "\n" || (word >= "A" && word <= "W") || (word >= "a" && word <= "w") || word == " " 
  		flag = 1
  	  file_out.print word
  	else
  	  if flag == 1
  	  	file_out.print word
  	  	flag =0
  	  else
  	  	file_out.print(" " + word)
  	  end
  	end
  end
end

file_out.close