require_relative 'return_calculator'

class YourReturnCalculator < ReturnCalculator
  def calculate!
    # Write your code here.
    # You have access to the `snapshots` variable.
    #
    # You can access the following properties of a snapshot:
    # snapshot.date
    # snapshot.cash_flow
    # snapshot.market_value

    # please forgive horrible variable naming
    returnValue = BigDecimal.new(1)
    marketValue = snapshots.shift

    snapshots.each do |snapshot|
        percent = ((snapshot.market_value - snapshot.cash_flow) / marketValue) - 1
        returnValue = returnValue * (1 + percent)
        marketValue = snapshot.market_value
    end

    return returnValue

  end
end
