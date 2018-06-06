require 'pry'

class CashRegister

  attr_accessor :total

  def initialize (discount=nil)
    @total = 0.0
    @previous_total = 0.0
    @items = []
    @discount = discount
  end

  def items
    @items
  end

  def discount
    @discount
  end

  def add_item(item, price, quantity=1)
    @previous_total = @total
    @total += price * quantity
    quantity.times do
      @items << item
    end
  end

  def apply_discount
    if @discount.nil?
      'There is no discount to apply.'
    else
      @total *= ((100.0 - @discount.to_f) / 100.0)
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def void_last_transaction
    @total = @previous_total
  end

end
