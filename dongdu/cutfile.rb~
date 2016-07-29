fileja_in = File.open ARGV[0], "r"
fileja_out1 = File.open "turn.ja", "w"
fileja_out2 = File.open "test.ja", "w"
fileja_out3 = File.open "train.ja", "w"
filevi_in = File.open ARGV[1], "r"
filevi_out1 = File.open "turn.vi", "w"
filevi_out2 = File.open "test.vi", "w"
filevi_out3 = File.open "train.vi", "w"

class Couper
  attr_reader :ja, :vi
  def initialize(ja, vi)
    @ja = ja
    @vi = vi
  end

  def ja
    @ja
  end

  def vi
    @vi
  end
end

def make_file(data, fileja_out, filevi_out, make_line = 0)
  if make_line == 0
    data.each do |couper|
      filevi_out.print couper.vi
      fileja_out.print couper.ja
    end
  else
    counter = 0
    until counter >= make_line
      flag = rand(data.count)
      counter += 1
      filevi_out.print data[flag].vi
      fileja_out.print data[flag].ja
      data.delete data[flag]
    end
  end
end

data = Array.new
fileja_in.each.zip(filevi_in.each).each do |ja, vi|
  couper = Couper.new(ja, vi)
  data << couper
end

make_file(data, fileja_out1, filevi_out1, data.count*0.1)
make_file(data, fileja_out2, filevi_out2, data.count*0.1)
make_file(data, fileja_out3, filevi_out3)
