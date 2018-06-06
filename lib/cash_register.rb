require 'pry'

class CashRegister

  attr_accessor :total, :items, :discount, :last_trans_cost
  @@all = []

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items =[]
    @@all << self
  end

  def items
    @items
  end

  def total
    @total
  end

  def self.all
    @@all
  end

  def add_item (title, price, quantity=1)
    quantity.times do
      @items.push(title)
    end
    @total += ((price * 1.0) * quantity)
    @last_trans_cost = ((price * 1.0) * quantity)
  end

  def apply_discount
    if @discount > 0
      @discount_amount = (@total * (@discount/100.0))
      @total -= @discount_amount
      "After the discount, the total comes to $#{@total.to_int}."
      #binding.pry
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @items.pop
    @total -= @last_trans_cost
  end
#binding.pry
end

#binding.pry
