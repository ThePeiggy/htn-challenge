# Dawon Lee
# koinichi.kr@gmail.com

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

		first = true
		prev = 0 
		ret = BigDecimal.new("1")
		snapshots.each { | snapshot |
			if not first
				# if prev is zero?
				ret *= (BigDecimal.new(snapshot.market_value) - BigDecimal.new(snapshot.cash_flow))/prev
			end
			prev = BigDecimal.new(snapshot.market_value)
			first = false
		}
		return ret - BigDecimal.new("1.0")
  end
end
