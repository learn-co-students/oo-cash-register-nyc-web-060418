require "pry"

class CashRegister

  attr_accessor :total, :employee_discount, :item_array, :last_item_price

  def initialize(emp_discount=0)
    @total = 0
    @employee_discount = emp_discount
    @item_array = []
    @last_item_price = nil
  end

  def discount
    @employee_discount
  end

  def total=(new_total)
    return @total = new_total
  end

  def add_item(item, price, quantity = 1)
    @total += price * quantity
    quantity.times do
      @item_array << item
      @last_item_price = price
    end
  end

  def apply_discount
    @total *= (1.0 - (@employee_discount / 100.0))
    if @employee_discount > 0
      return "After the discount, the total comes to $800."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @item_array
  end

  def void_last_transaction
    @item_array.pop
    @total -= @last_item_price
  end

end
