require 'pry'

class CashRegister

  attr_reader :discount
  attr_accessor :total, :items

  def initialize(employee_discount=0)
    @total = 0
    @discount = employee_discount
    @items = []
    @last_transaction = {}
  end

  def add_item(title, price, quantity=1)
    @total += price * quantity
    quantity.times do
      @items << title
    @last_transaction[:title] = title
    @last_transaction [:price] = price
    @last_transaction[:quantity] = quantity
    end
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    end

    @total = @total -  (@total * (@discount / 100.0))
    return "After the discount, the total comes to $#{@total.to_i}."
  end

  def void_last_transaction
    @total -= @last_transaction[:price]
    @items.delete(@last_transaction[:title])
  end
end

#binding.pry
