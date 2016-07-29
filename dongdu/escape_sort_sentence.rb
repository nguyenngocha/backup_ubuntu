file_in_ja = File.open(ARGV[0], "r")
file_in_vi = File.open(ARGV[1], "r")
file_out_ja = File.open(ARGV[2], "w")
file_out_vi = File.open(ARGV[3], "w")

file_in_ja.each.zip(file_in_vi.each).each do |ja, vi|
  if (vi.length - vi.gsub(" ", "").length >=2)
    file_out_ja.print ja
    file_out_vi.print vi
  end
end
