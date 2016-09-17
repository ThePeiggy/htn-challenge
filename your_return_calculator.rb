require_relative 'return_calculator'

class YourReturnCalculator < ReturnCalculator
  def calculate!
    naive_returns = []
    snapshots.each_with_index do |snapshot, index|
      unless index == 0
        naive_return = (snapshot.market_value - snapshot.cash_flow)/snapshots[index-1].market_value - 1
        naive_returns.push(naive_return)
      end
    end

    BigDecimal.new(geometric_link(naive_returns))
  end

  def geometric_link(naive_returns)
    cur_return = 1
    naive_returns.each do |naive_return|
      cur_return *= 1 + naive_return
    end
    cur_return - 1
  end
end
