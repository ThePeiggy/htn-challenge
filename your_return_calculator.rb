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

    len = snapshots.length

    # pairs of days next to each other
    snapshot_pairs = snapshots[0..(len-2)].zip(snapshots[1..(len-1)])

    # calculate the subperiod returns
    subperiod_returns = snapshot_pairs.map do |pair|
        ((pair[1].market_value - pair[1].cash_flow) / pair[0].market_value)
    end

    return subperiod_returns.reduce(1, :*) - 1
  end
end
