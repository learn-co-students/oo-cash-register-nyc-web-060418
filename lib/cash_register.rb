class CashRegister

  attr_reader :discount, :price, :title, :items, :item_total
  attr_accessor :total

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity=1)
    self.total += price*quantity
    quantity.times do
      @items << title
    end
  end

  def apply_discount
    if @discount != 0
      @total = total - total * @discount/100
      return "After the discount, the total comes to $#{total}."
    else return "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - self.total
  end

end
