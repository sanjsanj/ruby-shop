require 'json'
require_relative 'cart'
require_relative 'products'

class Shop
  attr_accessor :products, :cart

  def initialize(cart: default_cart, products: default_products)
    @products = products
    @cart = cart
  end

  def add_to_cart(id:)
    cart.add_item(id: id)
  end

  def cart_products
    cart.products
  end

  def cart_total
    cart.total
  end

  private

  def default_cart
    Cart.new
  end

  def default_products
    Products.data
  end
end
