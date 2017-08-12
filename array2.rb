# 配列の個数を数える1
# array の中にある、要素の個数を数えてputsしましょう（合計 11）
# array の中にある、数字の合計を出してputsしましょう（合計 39）
array = [[1, 5, 6, 8], [3, 3, 1,  1,  2], [4, 5]]
len = 0
num = 0

array.each do |i|
  len += i.size
  num += i.inject(:+)
end
puts "結果1: #{ len }"
puts "結果2: #{ num }"


# 配列の個数を数える2
# array の中にある、要素の個数を数えて puts しましょう (合計 11)
# array の中にある、数字の合計を出して puts しましょう (合計 39)
array = [[1, 5, 6, 8], [3, 3, 1,  1,  2], [4, 5]]
len = 0
num = 0
sum = 0

array.each do |i|
  len += i.size
  num = i
  num.each do |j|
    sum += j
  end
end
puts "結果3: #{ len }"
puts "結果4: #{ sum }"
