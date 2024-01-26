# 株式会社ABC,12345
# 株式会社ABC,67890
# 株式会社zzz,00000
# 株式会社zzz,11111
      
#          ↓
# *12345*67890*
# *00000*11111*
# ----------------------------------------------------------------

array = []
file = File.open("産直.txt", "r:SJIS")
  file.each_line do |line|
    data = line.split(",")
    puts data
    hash = {
      company: data[0],
      key: data[1].chomp
    }
    array << hash  
  end

result = []

# 配列の要素の値を入れる変数
current_value = nil

array.each do |value|
  if value[:company] != current_value
    result << [value[:key]]
    current_value = value[:company]
  else
    result.last << value[:key]
  end
end

filename = "産直_連結.txt"

File.open(filename, "w") do |file|
  result.each do |group|
    file.puts("*" + group.join("*") + "*")  
  end
end