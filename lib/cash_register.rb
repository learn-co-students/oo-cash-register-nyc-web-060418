require 'pry'

class CashRegister

  def initialize( discount  = 0 )
    @total = 0
    @discount = discount
    @items = []
    @last_trans_amount = 0
  end

  # attr_accessor :total
  def total=(total)
    @total = total
  end

  def total
    @total
  end

  def discount
    @discount
  end

  def add_item(title, price, quantity = 1)
    quantity.times {@items.push(title)}
    @last_trans_amount = price * quantity
    # why does it not work with the variable name total
    @total += (price * quantity)
  end

  def apply_discount
    if @discount != 0
      @total = (@total/100 )* (100 - @discount)
      # binding.pry
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - @last_trans_amount
  end

end
