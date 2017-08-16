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
temp = {}
cars.each do |car|
  total += car.weight
  puts "#{ car.company }\t#{ car.weight }\t#{ car.color }"
  i = temp[car.company]
    if i == nil
      i = 0
    end
  # n = i + 1
  temp[car.company] = i + 1
end

avg = total / cars.size
puts "合計重量: #{ total }kg"
puts "平均重量: #{ avg }kg"
puts "一番台数が多いのは#{ temp.keys.max }の#{ temp.values.max }台です！"
puts "一番台数が少ないのは#{ temp.keys.min }の#{ temp.values.min }台です！"
if temp.values.max == temp.values.min
  puts "両者は互角です！"
end
