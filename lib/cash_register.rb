require 'pry'

class CashRegister

  attr_accessor :total, :discount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end

  def self.total
    @total
  end

  def add_item(title, price, qty = 1)
    qty.times do
      @total += price
      @items << title
    end
    @last_transaction = @total
  end

  def apply_discount
    if @discount != 0
      @total -= (@total * (@discount/100.0)).to_i
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_transaction
  end

end
