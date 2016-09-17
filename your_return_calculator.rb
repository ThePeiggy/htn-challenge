# Name: Jashan Shewakramani
# email: jashan1998s@gmail.com
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

    # slowly calculate the naive returns between each day
    i = 0
    naive_returns = []
    while i < snapshots.length - 1
      naive_returns << (((snapshots[i+1].market_value - snapshots[i+1].cash_flow) / snapshots[i].market_value) - 1)
      i += 1
    end

    # now iterate over the naive returns to get the result
    result = 1
    naive_returns.each do |elem|
      result *= (1 + elem)
    end

    return result - 1
  end
end
