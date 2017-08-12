# 配列の個数を数える1
## array の中にある、要素の個数を数えてputsしましょう（合計 11）
## array の中にある、数字の合計を出してputsしましょう（合計 39）
array = [[1, 5, 6, 8], [3, 3, 1,  1,  2], [4, 5]]
len = 0
num = 0

array.each do |i|
  len += i.size
  num += i.inject(:+)
end
puts "結果1.1: #{ len }"
puts "結果1.2: #{ num }"


# 配列の個数を数える2
## array の中にある、要素の個数を数えて puts しましょう (合計 11)
## array の中にある、数字の合計を出して puts しましょう (合計 39)
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
puts "結果1.3: #{ len }"
puts "結果1.4: #{ sum }"

# 文字を連結する
## 下記の配列の中の文字列を連結して「いろはにほへとちりぬるを」を完成してputsしてください
array = [['いろ', 'は', 'にほへ'], ['と', 'ちり'], [ 'ぬ',  'る',  'を']]

puts "結果2: #{ array.join }"

# 一定の条件の場合だけ合計する（数値）1
## 偶数の場合だけ加算して、結果をputsしてください
## 偶数の値だけが入った新しい配列を array2 という変数で作ってください
array = [[1, 5, 6, 8], [3, 3, 1,  1,  2], [4, 5]]
sum = 0
array2 = []

array.each do |i|
  i.select do |j|
    if j % 2 == 0
      sum += j
      array2 << j
    end
  end
end

puts "結果3.1: #{ sum }"
puts "結果3.2: #{ array2 }"


# 一定の条件の場合だけ合計する（数値）2
array = [[1, 5, 6, 8], [3, 3, 1,  1,  2], [4, 5]]
sum_odd  = 0
sum_even = 0
array_odd  = []
array_even = []

array.each do |i|
  i.select do |j|
    if j % 2 == 0
      sum_odd   += j
      array_odd << j
    else
      sum_even   << j
      array_even << j
    end
  end
end

puts "結果3.3: #{ sum_odd }"
puts "結果3.4: #{ array_odd }"
puts "結果3.5: #{ sum_even }"
puts "結果3.6: #{ array_even }"
