file_in = File.open(ARGV[0], "r")
file_out= File.open(ARGV[1], "w")
DEFAULT = 100

def token(block, file_out)
  fin = File.open("fin","w")
  fin.print block
  puts `./vnTokenizer.sh -i fin -o fout`
  fout = File.open("fout", "r")
  fout.each_line do |line|
    file_out.print line
  end  
end

counter = 0
block = ""
file_in.each_line do |line|
  if counter <= DEFAULT
    counter += 1
    block += line
  else
    token(block, file_out)
    counter = 0
    block = ""
  end
end
