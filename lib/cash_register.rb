require 'pry'
class CashRegister
attr_accessor :total, :discount

def initialize(discount=0, total=0)
  @my_items = []
  @total = 0
  @discount = discount
end

def total
  @total
end

def add_item(item, price, quantity=1)
  @item = item
  @price = price
  @quantity = quantity
  @total = @total + (price * quantity)
  @quantity.times do
    @my_items << @item
  end
end

def apply_discount
  if @discount == 0
    return "There is no discount to apply."
  else
  @total = @total - (@total * @discount / 100)
  return "After the discount, the total comes to $#{@total}."
  end
end

def items
   @my_items
end

def void_last_transaction()
  @total = @total - @price
end

end
