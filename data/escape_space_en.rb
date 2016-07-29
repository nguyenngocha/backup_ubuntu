fileja_in = File.open ARGV[0], "r"
fileja_out = File.open ARGV[0].gsub("ja", "out.ja") , "w"
filevi_in = File.open ARGV[1], "r"
filevi_out = File.open ARGV[1].gsub("vi", "out.vi"), "w"

class String
  def is_blank?
    self.to_s == "\n"
  end
  def escape?
    !(self.to_s =~ /[a-zA-Z]/).nil?
  end
end

fileja_in.each.zip(filevi_in.each).each do |ja, vi|
  unless vi.to_s.is_blank?
    unless ja.to_s.escape?
      filevi_out.print vi
      fileja_out.print ja
    end
  end
end

#call: ruby escape_space_en.rb <.ja> <.vi>

