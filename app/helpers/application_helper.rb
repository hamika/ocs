module ApplicationHelper
  def percentize(value)
    value *= 100
    "#{value.floor(2)}%"
  end

  def remaining(value)
    if value < 0
      value *= -1
      "あと#{value}件"
    elsif value > 0
      "達成 +#{value}"
    else
      "達成"
    end
  end

  def yen(value)
    if value < 0
      value *= -1
      value.to_s(:currency, unit: '¥', precision: 0)
    else
      value.to_s(:currency, unit: '¥', precision: 0)
    end
  end
end
