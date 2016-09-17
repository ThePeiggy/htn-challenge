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
    previous = snapshots[0].market_value
    snapshots.shift
    twr = 1

    for s in snapshots
      naive = (s.market_value - s.cash_flow) / previous
      twr = twr * naive
      previous = s.market_value
    end

    twr = twr - 1
    return twr
  end
end
