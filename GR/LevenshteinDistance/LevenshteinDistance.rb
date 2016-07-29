PASENT = 60
LOOK = 2

def levenshtein(first, second)
  matrix = [(0..first.length).to_a]
  (1..second.length).each do |j|
    matrix << [j] + [0] * (first.length)
  end

  (1..second.length).each do |i|
    (1..first.length).each do |j|
      if first[j-1] == second[i-1]
        matrix[i][j] = matrix[i-1][j-1]
      else
        matrix[i][j] = [
          matrix[i-1][j],
          matrix[i][j-1],
          matrix[i-1][j-1],
        ].min + 1
      end
    end
  end
  return matrix.last.last
end

# dau vao la toan bo file 
# dau ra la file da loai bo het dau space 

# dau vao la tri so index 2 file
# dau ra la collect file_fvi.
def collect(index_vi, index_ja, collect, f_vi)
	while index_ja - index_vi < LOOK do
		line = f_vi.readline
			collect << line
			index_ja += 1
		# p collect.size
		# print collect.size
		# p "|||"
		if collect.size > LOOK*2+1
			collect.delete_at(0)
		end
	end
	index_ja
end

# dau vao la 1 dong ben f_ja va 1 collect ben f_vi.
# dau ra la collect moi da loai bo dong tuong quan vs f_vi
## 1 dong ben f_ja + 1 dong ben f_vi dc ghi vao file
#reorder
def compare(string, collect,reorder_ja)
	index = Array.new()
	collect.each{ |stringcmp| 
		falseword = levenshtein(stringcmp,string)
		maxlen = [string.length,stringcmp.length].max
		index << (maxlen - falseword)*100/maxlen
	}

	#neu dich tu vi->ja thi can sap xep lai .ja -> +file .ja
	if index.max > PASENT 
		reorder_ja.write(collect[index.index(index.max)])
		collect.delete_at(index.index(index.max))
	else
		reorder_ja.write("\n")
	end
	#index.min la so sai khac nho nhat
	#index.index[] la tim index cua cau do trong collect
	#collect[] la lay cau do trong collect
	#delete...

end



f_ja = File.open("train.tok.ja", "r") 
f_vi = File.open("vi-ja.test.ja", "r")
# doc file ja.from.vi de sap xep file .ja
# file can sap xep : train.tok.ja dua vao file vi-ja.test.ja 

# doc f_vi(chuan) -> sap xep file f_ja(xao tron)
index_ja = 0 # 
index_vi = 0 # 
collect = Array.new 
reorder_ja = File.open("reoder60.ja","w")
# them ham tao vong lap # do

while true
	l = f_vi.readline
	index_ja = collect(index_vi,index_ja,collect,f_ja)
	# p collect
	# p "-------------------------------------------"
	# print "%d |%d \n" % [index_vi,index_ja] 
	# print /r
	compare(l,collect,reorder_ja)
	index_vi+=1
end

