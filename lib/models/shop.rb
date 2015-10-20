require 'json'
require_relative 'cart'
require_relative 'products'

class Shop
  attr_accessor :cart, :products

  def initialize(cart: Cart.new, products: Products.new)
    @products = products
    @cart = cart
  end

  def shop_products
    products.data
  end
  
  def add_to_cart(id:)
    cart.add_item(item: item(id: id))
    products.decrement_stock(id: id)
  end

  def cart_total
    cart.total
  end

  private

  def item(id:)
    products.find(id: id)
  end

  def default_cart
    to_return ||= Cart.new
  end

  def default_products
    to_return ||= Products.new
  end
end
