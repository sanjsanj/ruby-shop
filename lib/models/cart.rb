class Cart
  attr_accessor :products

  def initialize
    @products = []
  end

  def add_item(item:)
    cart_contains_item?(item: item) ? increment_quantity(item: item) : add_to_cart(item: item)
  end

  def total
    products.inject(0) do |sum, product|
      sum += (product['price'] * product['cart_quantity'])
    end
  end

  def cart_contains_item?(item:)
    products.find { |product| product['id'] == item['id'] }
  end

  def increment_quantity(item:)
    product = products.find { |product| product['id'] == item['id'] }
    product['cart_quantity'] += 1
  end

  def add_to_cart(item:)
    products << item
    increment_quantity(item: item)
  end
end
