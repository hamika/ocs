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

cars.each do |car|
  total += car.weight
end

average = total / num

puts "合計重量: #{ total }kg"
puts "平均重量: #{ average }kg"
