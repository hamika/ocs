# 配列の個数を数える1
## array の中にある、要素の個数を数えてputsしましょう (合計 11)
## array の中にある、数字の合計を出してputsしましょう (合計 39)
array = [[1, 5, 6, 8], [3, 3, 1,  1,  2], [4, 5]]
len = 0
total = 0

array.each do |items|
  len += items.size
  total += items.inject(:+)
end
puts "結果1.1: #{ len }"
puts "結果1.2: #{ total }"


# 配列の個数を数える2
## array の中にある、要素の個数を数えて puts しましょう (合計 11)
## array の中にある、数字の合計を出して puts しましょう (合計 39)
array = [[1, 5, 6, 8], [3, 3, 1,  1,  2], [4, 5]]
len = 0
# num = 0
sum = 0

array.each do |items|
  len += items.size
  num  = items
  num.each do |item|
    sum += item
  end
end
puts "結果1.3: #{ len }"
puts "結果1.4: #{ sum }"


# 文字を連結する
## 下記の配列の中の文字列を連結して「いろはにほへとちりぬるを」を完成してputsしてください
array = [['いろ', 'は', 'にほへ'], ['と', 'ちり'], [ 'ぬ',  'る',  'を']]
results = ""

array.each do |items|
  items.each do |item|
    results << item
  end
end
puts "結果2: #{ results }"


# 一定の条件の場合だけ合計する (数値) 1
## 偶数の場合だけ加算して、結果をputsしてください
## 偶数の値だけが入った新しい配列を array2 という変数で作ってください
array = [[1, 5, 6, 8], [3, 3, 1,  1,  2], [4, 5]]
sum = 0
array2 = []

array.each do |items|
  items.select do |item|
    if item % 2 == 0
      sum += item
      array2 << item
    end
  end
end

puts "結果3.1: #{ sum }"
puts "結果3.2: #{ array2 }"


# 一定の条件の場合だけ合計する (数値) 2
array = [[1, 5, 6, 8], [3, 3, 1,  1,  2], [4, 5]]
sum_odd  = 0
sum_even = 0
array_odd  = []
array_even = []

array.each do |items|
  items.select do |item|
    if item % 2 == 0
      sum_odd += item
      array_odd << item
    else
      sum_even += item
      array_even << item
    end
  end
end

puts "結果3.3: #{ sum_odd }"
puts "結果3.4: #{ array_odd }"
puts "結果3.5: #{ sum_even }"
puts "結果3.6: #{ array_even }"


# 一定の条件の場合だけ合計する (文字列)
## 下記の配列の中の文字列を連結して「いろはにほへとちりぬるを」を完成してputsしてください。途中に入り込んでいる数値を連結しない方法を考えましょう。
array = [['いろ', 0, 'は', 4, 'にほへ'],
         ['と', 9, 'ちり'],
         ['ぬ', 'る', 10, 'を']]
results = []
result  = []

array.each do |items|
  results << items.grep(String)
  result  =  results.join
end

puts "結果4: #{ result }"


# ハッシュのキーを使う
## 下記のハッシュの中からキーだけ取り出し'佐藤,鈴木,田中'とputsしてください。
## 同様に値だけを取り出して'1,2,3'とputsしてください。

hash = { '佐藤' => 1,'鈴木' => 2,'田中' => 3 }
keys = []
values = []

hash.each do |key, value|
  keys << key
  values << value
end

puts "結果: #{ keys }"
puts "結果: #{ values }"





result = 0

(1..100).each do |math|
  result += math
end

puts result
