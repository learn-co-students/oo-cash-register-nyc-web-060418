class CashRegister
  attr_accessor :total
  attr_accessor :discount
  attr_accessor :cart
  attr_accessor :last_transaction 
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @cart = []
  end
  
  def add_item(title, price, quantity = 1)
    @total += price * quantity
    if quantity > 1 
      quantity.times do 
        (@cart << title)
        @last_transaction = price 
      end 
    else 
      @cart << title 
      @last_transaction = price 
    end 
  end
  
  def apply_discount
    if self.discount != 0  
      @total = total - (total * (self.discount / 100.0))
      return "After the discount, the total comes to $#{total.to_i}."
    else
      return "There is no discount to apply."
    end 
  end 
  
  def items 
    @cart
  end 
  
  def void_last_transaction
    @total -= @last_transaction
  end 
end 