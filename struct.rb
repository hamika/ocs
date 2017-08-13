Car = Struct.new(:company, :weight, :color)

prius = Car.new("toyota", 2000, "red")
wagon_r = Car.new("toyota", 2000, 900)
puts prius.company
puts prius.weight
puts wagon_r.color
