class Cart
  attr_accessor :products

  def initialize
    @products = []
  end

  def add_item(id:)
    item = (Products.find(id: id))
    products << item
  end

  def total
    0
  end
end
