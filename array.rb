# 配列の中身を全て合計する
array  =  [4, 6, 7, 9]
result = 0
array.each{ |i| result += i }
puts "結果1: #{result}"

array  =  [4, 6, 7, 9]
result = 0
array.each do |item|
  result = result + item
end
puts "結果2: #{result}"

array  =  [4, 6, 7, 9]
result =  array.inject(:+)
puts "結果3: #{result}"
