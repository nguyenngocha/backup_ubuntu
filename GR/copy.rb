folder_corpus = "crawler/corpus"
folder_name = "crawler"

def corpus folder_name
  Dir.entries(folder_name).each do |a|
	if (!File.directory? a) &&(!a.include?".gz")&& (!a.include?"xml")&&(!a.include?".rb") &&(!a.include?".txt") && (!a.include?".corpus")&&(a!="tatoeba")&&(a!="Webdata")&&(a!="test")&&(!a.include?"out")&&(!a.include?"text")&&(a!="vi")
	    corpus (folder_name + "/" + a)
	elsif a.include?".corpus"
		link_form_ja = folder_name + "/" + a
		# puts link_form_ja
		link_form_vi = link_form_ja.gsub("ja","vi")
		link_to_ja = ("crawler/corpus/ja/" + a)
		link_to_vi = link_to_ja.gsub("ja","vi")
		puts `cp #{link_form_ja} #{link_to_ja}`
		puts `cp #{link_form_vi} #{link_to_vi}`
		puts "cp #{link_form_ja} #{link_to_ja}"
	end
  end
end

corpus folder_name