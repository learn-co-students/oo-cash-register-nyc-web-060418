class CashRegister

  def initialize( discount  = 0 )
    @total = 0
    @discount = discount
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

  def add_item(title, price)

  end


end
