module ApplicationHelper
  def percentize(value)
    value *= 100
    value.to_s(:percentage, precision: 2, delimiter: ',', separator: '.')
  end
end
