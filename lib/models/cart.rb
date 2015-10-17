class Cart
  attr_accessor :products

  def initialize
    @products = []
  end

  def add_item(id:)
    cart_contains_item?(id: id) ? increment_quantity(id: id) : add_to_cart(id: id)
    p products
  end

  def total
    0
  end

  private

  def cart_contains_item?(id:)
    products.find { |product| product['id'] == id }
  end

  def increment_quantity(id:)
    product = products.find { |product| product['id'] == id }
    product['cart_quantity'] += 1
  end

  def add_to_cart(id:)
    products << Products.find(id: id)
    increment_quantity(id: id)
  end
end
