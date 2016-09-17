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

	# accumulate the linked value online
    total = BigDecimal.new(1)
    (0..(snapshots.length-2)).each do |n|
		today = snapshots[n+1].market_value - snapshots[n+1].cash_flow
		yesterday = snapshots[n].market_value
		# don't need to subtract 1 because we add one later for the linking
		total *= today/yesterday
	end
	return total - BigDecimal.new(1)
  end
end
