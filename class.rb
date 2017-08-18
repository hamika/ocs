class Car
  attr_accessor :company, :weight, :color

  def initialize(company, weight, color)
    @company = company
    @weight = weight
    @color = color
  end
end

cars = [Car.new('toyota', 5000, 'red'),   Car.new('honda',  4560, 'blue'),
        Car.new('mazda', 3200, 'green'),  Car.new('suzuki',  4560, 'blue'),
        Car.new('subaru',  4560, 'blue'), Car.new('nissan', 5000, 'red'),
        Car.new('toyota',  4560, 'blue'), Car.new('honda', 3200, 'green'),
        Car.new('toyota',  4560, 'blue'), Car.new('mazda',  4560, 'blue'),
        Car.new('subaru', 5000, 'red'),   Car.new('suzuki',  4560, 'blue'),
        Car.new('toyota', 3200, 'green'), Car.new('honda',  4560, 'blue'),
        Car.new('toyota',  4560, 'blue'), Car.new('subaru',  4560, 'blue')]

total = 0
company_to_count = {}
cars.each do |car|
  total += car.weight
  puts "#{ car.company }\t#{ car.weight }\t#{ car.color }"
  i = company_to_count[car.company]
    if i == nil
      i = 0
    end
  n = i + 1
  company_to_count[car.company] = n
end
avg = total / cars.size
sum_up = company_to_count.sort { |a, b| b[1] <=> a[1] }
puts "#{ sum_up }"
puts "合計重量: #{ total }kg"
puts "平均重量: #{ avg }kg"
puts "一番台数が多いのは#{ sum_up.first[0] }の#{ sum_up.first[1] }台です！"
puts "一番台数が少ないのは#{ sum_up.last[0] }の#{ sum_up.last[1] }台です！"
if sum_up.first == sum_up.last
  puts "両者は互角です！"
end
