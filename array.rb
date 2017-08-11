# 配列の中身を全て合計する
array  =  [4, 6, 7, 9]
result =  0
array.each { |i| result += i }
puts "結果1: #{result}"

array  =  [4, 6, 7, 9]
result =  array.inject(:+)
puts "結果2: #{result}"

# ハッシュが入っている配列の中身を合計する
array  =  [{value: 4}, {value: 6}, {value: 7}, {value: 9}]
result =  0
result =  array.map { |i| i[:value] }.inject(:+)
puts "結果3: #{result}"

array  =  [{value: 4}, {value: 6}, {value: 7}, {value: 9}]
result =  0
array.each { |i| result += i[:value] }
puts "結果4: #{result}"

array  = [{value: 4}, {value: 6}, {value: 7}, {value: 9}]
result = []
array.each { |i| result << i[:value] }
result = result.inject(:+)
puts "結果5: #{result}"
