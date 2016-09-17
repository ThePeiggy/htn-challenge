require_relative 'return_calculator'

class YourReturnCalculator < ReturnCalculator
  def calculate!
    $length = snapshots.length
    $i = 0
    subperiods = Array.new
    while $i < $length - 1 do
        market_value_1 = snapshots[$i].market_value
        market_value_2 = snapshots[$i+1].market_value
        cash_flow_2 = snapshots[$i+1].cash_flow
        if market_value_1 == 0
            return 0
        end
        subperiod = ((market_value_2 - cash_flow_2)/market_value_1) - 1
        subperiods.push(subperiod)
        $i += 1
    end
    # geo linking time
    answer = 1
    $i = 0
    while $i < $length - 1 do
        answer *= (1 + subperiods[$i])
        $i += 1
    end
    BigDecimal.new(answer - 1)
  end
end
