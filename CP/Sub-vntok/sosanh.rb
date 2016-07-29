filein1 = File.open(ARGV[0], "r")
filein2 = File.open(ARGV[1], "r")

i = 0
filein1.each.zip(filein2.each).each do |line1, line2|
  unless line1[0] == line2[0]
  	puts i
  	break
  end
  i+=1
end 