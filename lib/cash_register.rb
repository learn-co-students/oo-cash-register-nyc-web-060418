require 'pry'
class CashRegister

  attr_accessor :total, :discount, :items, :last_transation

  def initialize (employee_discount=0)
    @total = 0
    @discount = employee_discount
    @items = []
    @last_transation = {}
  end

  def total
    @total
  end

  def add_item(title, price, quantity=1)
    @total += price * quantity
    quantity.times do
      @items << title
      @last_transation[:title] = title
      @last_transation[:price] = price
      @last_transation[:quantity] = quantity
    end
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    else
      @total = ((100 - @discount).to_f / 100) * @total
      return "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_transation[:price]
    @items.delete(@last_transation[:title])
  end
end
