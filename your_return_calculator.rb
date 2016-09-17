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
    if snapshots.size == 0
      return 0
    end
    previous_market_value = snapshots[0].market_value
    snapshots.shift
    twr = 1

    for snapshot in snapshots
      if previous_market_value != 0
        # can't divide by 0, so just set return for the sub-period to 1
        naive = 1
      else
        naive = (snapshot.market_value - snaphot.cash_flow) / previous_market_value
      end
      twr = twr * naive
      previous_market_value = s.market_value
    end

    twr = twr - 1
    return twr
  end
end
