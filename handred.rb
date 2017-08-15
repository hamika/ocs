def handred(min, max) # 生成する数値の範囲を指定
  x_ary = []
  y_ary = []
  cnt = 0
# ランダムな数値の入った配列を生成
  while cnt < 10 do
    random = Random.new
    x_ary << random.rand(min..max)
    y_ary << random.rand(min..max)
    cnt += 1
  end

  add_table = []
  sub_table = []
  mul_table = []
  div_table = []
  exp_table = []
  mod_table = []
# x, yから四則演算, 冪乗算, 剰余算した100マス分の配列を生成
  x_ary.each do |x|
    y_ary.each do |y|
      add_table << x + y
      sub_table << x - y
      mul_table << x * y
      div_table << x / y
      exp_table << x ** y
      mod_table << x % y
    end
  end

  puts "XXXXXX: #{ x_ary }"
  puts "YYYYYY: #{ y_ary }"
  puts "足し算: #{ add_table }"
  puts "引き算: #{ sub_table }"
  puts "掛け算: #{ mul_table }"
  puts "割り算: #{ div_table }"
  puts "冪乗算: #{ exp_table }"
  puts "剰余算: #{ mod_table }"
end

handred(1, 12)
handred(12, 36)
