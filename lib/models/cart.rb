class Cart
  attr_accessor :products

  def initialize
    @products = []
  end

  def add_item(item)
    products << item
  end

  def total
    0
  end
end
