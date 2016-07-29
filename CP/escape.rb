file_in = ARGV[0]
file_out = file_in + ".es"

fin = File.open(file_in, "r")
fout = File.open(file_out, "w")

cin = ARGV[1]
cout = ARGV[2]

puts cin
puts cout

fin.each do |line|
  	fout.print line.gsub(cin, cout)
end