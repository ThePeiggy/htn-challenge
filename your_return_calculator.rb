require_relative 'return_calculator'

class YourReturnCalculator < ReturnCalculator
  def calculate!

    case snapshots.length
    when 0 # Edge case: if there is only one day, return 0
      0
    else # Otherwise:

      time_weighted_return = BigDecimal.new(1) # Better accuracy with floating point operations

      prev_snapshot = snapshots[0].market_value # Set prev_snapshot

      for snapshot in snapshots[1..-1] do # Loop starting from second day

        unless prev_snapshot == 0 then # Skip days where the market value is 0
          time_weighted_return *= (snapshot.market_value - snapshot.cash_flow)/prev_snapshot
          prev_snapshot = snapshot.market_value
        end
      end

      time_weighted_return - 1 # return the compounded return
    end
  end
end
