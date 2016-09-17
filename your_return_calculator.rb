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
    previous_snapshot = nil
    total_return = BigDecimal.new(1)
    for snapshot in snapshots do
      if previous_snapshot != nil then
        period_return = (snapshot.market_value - snapshot.cash_flow) / previous_snapshot.market_value
        total_return = total_return * period_return
      end
      previous_snapshot = snapshot
    end
    return total_return - 1
  end
end
