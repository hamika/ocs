module ApplicationHelper
  def percentize(value)
    value *= 100
    value.to_s(:percentage, precision: 3, delimiter: '.', separator: ',')
  end
end
