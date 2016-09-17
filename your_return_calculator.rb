require_relative 'return_calculator'

class YourReturnCalculator < ReturnCalculator
  def calculate!
    iterations = snapshots.length - 1
    product = 1
    if (iterations > 1)
      prevMarket = snapshots.first.market_value
    else
      puts "Cannot calculate for period less than 2 days"
      return 0
    end

    #my underscore key is broken i would have used snakecase... hahaha
    iterations.times do |subperiod|
      currMarket = snapshots[subperiod+1].market_value
      currCash = snapshots[subperiod+1].cash_flow
      if prevMarket == 0
        puts "Cannot divide by 0"
        return product-1
      end
      #prevent rounding
      product *= (currMarket-currCash)/prevMarket.to_f
      prevMarket = currMarket
    end
    return product-1
    ##???? BIG DECIMAL???
    BigDecimal.new(0)
  end
end
