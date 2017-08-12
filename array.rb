# 配列の中身を全て合計する1
array  = [4, 6, 7, 9]
result = 0

array.each { |i| result += i }

puts "結果1: #{ result }"



# 配列の中身を全て合計する2
array  = [4, 6, 7, 9]
result = 0

result = array.inject(:+)

puts "結果2: #{ result }"

# ハッシュが入っている配列の中身を合計する1
array  = [{ value: 4 }, { value: 6 }, { value: 7 }, { value: 9 }]
result = 0

result = array.map { |i| i[:value] }.inject(:+)

puts "結果3: #{ result }"


# ハッシュが入っている配列の中身を合計する2
array  = [{ value: 4 }, { value: 6 }, { value: 7 }, { value: 9 }]
result = 0

array.each { |i| result += i[:value] }

puts "結果4: #{ result }"


# ハッシュが入っている配列の中身を空の配列に合計する
array  = [{value: 4}, {value: 6}, {value: 7}, {value: 9}]
result = []

array.each { |i| result << i[:value] }
result = result.inject(:+)

puts "結果5: #{ result }"


# 配列が入っている配列の中身を合計する
array  = [[4], [6], [7], [9]]
result = 0

array.each do |i|
  result += i[0]
end

puts "結果6: #{ result }"


# 複数の処理を一度に行う
array = [{ value: 4, xxx: 1 }, { value: 6, xxx: 3 },
         { value: 7, xxx: 9 }, { value: 9, xxx: 4 }]
value_result = 0
xxx_result   = 0

array.each do |i|
  value_result += i[:value]
  xxx_result   += i[:xxx]
end

puts "結果7: #{ value_result }, #{ xxx_result }"


# ハッシュが入っている配列の中身を合計する3
array  = [{ value: 1 }, { value: 2 }, { value: 2 }]
result = 0

array.each do |i|
  result += i[:value]
end

puts "結果8: #{ result} "


# 複雑な構造から値を合計する
array  = [{ test: 123, value: [{ value: 1 }, { value: 2 }] },
          { test: 444, value: [{ value: 2 }, { value: 4 }, { value: 5 }] },
          { test: 566, value: [{ value: 3 }, { value: 4 }] }]
result = 0

array.each do |i|
  num = i[:value]
  sum = 0

  num.each do |j|
    sum += j[:value]
  end

result += sum
end

puts "結果9: #{ result }"


# 文字列の長さを合計する
array = [{ value: 4, xxx: "ああ" }, { value: 6, xxx: "本日は" },
         { value: 7, xxx: "晴天" }, { value: 9, xxx: "ですか？" }]
value_result = 0
xxx_result   = 0

array.each { |i| value_result += i[:value] }
xxx_result = "array[:xxx]".size

puts "結果10.1: #{ value_result }"
puts "結果10.2: #{ xxx_result }"
