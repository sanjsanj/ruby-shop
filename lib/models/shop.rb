require 'json'
require_relative 'cart'
require_relative 'products'

class Shop
  attr_accessor :products, :cart

  def initialize(cart: default_cart, products: default_products)
    @products = products
    @cart = cart
  end

  def add_to_cart_by_id(id)
    item = products.select { |product| product[:id] == id.to_i }
    cart.add_item(item)
    decrement_shop_quantity(item)
  end

  private

  def default_cart
    Cart.new
  end

  def default_products
    Products.data
  end
end
