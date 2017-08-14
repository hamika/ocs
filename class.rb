class Car
  attr_accessor :company, :weight, :color

  def initialize(company, weight, color)
    @company = company
    @weight = weight
    @color = color
  end
end

cars = [Car.new('toyota', 5000, 'red'),
        Car.new('honda',  4560, 'blue'),
        Car.new('toyota', 3200, 'green')]
total = 0
num = cars.size
array = []

cars.each do |car|
  total += car.weight
  puts "#{ car.company }\t#{ car.weight }\t#{ car.color }".gsub(/red|blue|green/,
                                                                'red' => '赤',
                                                                'blue' => '青',  'green' => '緑')
  array << car.company
end

average = total / num
puts "合計重量: #{ total }kg"
puts "平均重量: #{ average }kg"

toyota = array.count('toyota')
honda  = array.count('honda')
sum = toyota <=> honda
puts "トヨタ: #{ toyota }台"
puts "ホンダ: #{ honda }台"

if toyota > honda
  puts "トヨタの方が#{ sum }台多いです！"
elsif toyota < honda
  puts "ホンダの方が#{ sum }台多いです！"
else toyota == honda
  puts "両者は互角です！"
end
