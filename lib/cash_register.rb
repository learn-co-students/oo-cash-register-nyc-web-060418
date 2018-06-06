class CashRegister

  attr_accessor :total, :employee_discount, :last_transaction

  def initialize(employee_discount = nil)
    @total = 0
    @employee_discount = employee_discount
    @last_transaction = 0
    @@all = []
  end

  def discount
    if @employee_discount
      return @employee_discount
    end
  end

  def add_item(title, price, quantity = nil)
    if quantity
      @total += (price * quantity)
      @last_transaction = @total
      quantity.times do |x|
        @@all << title
      end
    else
      @total += price
      @last_transaction = total
      @@all << title
    end
  end

  def apply_discount
    if @employee_discount
      @total = @total * (1.0 - (@employee_discount / 100.0))
      p "After the discount, the total comes to $#{@total.round}."
    else
      p "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transaction
  end

  def items
    @@all
  end

end
