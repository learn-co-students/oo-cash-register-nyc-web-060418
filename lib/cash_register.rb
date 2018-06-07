require 'pry'

class CashRegister

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
  end

  attr_accessor :total

  def discount
    @discount
  end

  def total
    @total
  end


  def add_item(title, price, quantity = nil)
    @price = price
    if quantity
      quantity.times do
      @items  << title
      end
      @price = price * quantity
    else
      @items << title
    end
    @total += @price
  end

  def apply_discount
    if @discount
      @total -= @total * (@discount / 100.0)
      @total = @total.round
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @price
    #I need to access the price of the last item added
    #I need to subtract the price of the last item added from the total


  end

end

# bank = CashRegister.new
# bank.add_item("tomato", 1.76)
# puts bank.void_last_transaction



# p bank.apply_discount

# bah = CashRegister.new

# binding.pry
