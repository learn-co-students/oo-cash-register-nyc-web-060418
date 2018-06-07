require 'pry'

class CashRegister

  attr_accessor :total, :discount


  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @cart_item = []
    @cart_price = []
  end

  def add_item(title, price, quantity = 1)

    @total += price * quantity

    for item in 1..quantity do
      @cart_item << title
      @cart_price << price
    end
  end

  def apply_discount
    @total *= (1 - @discount/100.00)
    if @discount != 0
      p "After the discount, the total comes to $#{@total.to_i}."
    else
      p "There is no discount to apply."
    end
  end

  def items
    @cart_item
  end

  def void_last_transaction
    @cart_item.pop
    @total -= @cart_price[-1]
  end
end
