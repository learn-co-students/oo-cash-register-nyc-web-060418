require 'pry'

class CashRegister

  attr_accessor :total
  attr_accessor :discount
  attr_accessor :item_name
  attr_accessor :items_hash

  @@items_arr = []

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items_hash = {}
  end

  def add_item(item_name, price, quantity = 1)
    @items_hash[item_name] = [price, quantity]
    @total += quantity * price
  end

  def apply_discount
    if @discount != 0
      @total -= @total * (@discount / 100.0)
      return "After the discount, the total comes to $#{ @total.to_i }."
    else
      return "There is no discount to apply."
    end
  end

  def check_quantity(item, num)
    if num > 1
      (num - 1).times do
        @@items_arr << item
      end
    end
  end

  def items
    @items_hash.collect do |item, info|
      @@items_arr << item
      item
      check_quantity(item, info[1])
    end
    @@items_arr
  end

  def void_last_transaction
    last_added_item = @items_hash.keys.last
    last_transaction = 0
    @items_hash.each do |item, info|
      last_transaction = info[0] * info[1] if item == last_added_item
    end
    @total -= last_transaction
  end

end
