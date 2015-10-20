require 'json'
require_relative 'cart'
require_relative 'products'

class Shop
  attr_accessor :shop_products, :cart, :products

  def initialize(cart: default_cart, products: default_products)
    @shop_products = products.data
    @cart = cart
  end

  def add_to_cart(id:)
    cart.add_item(item: item(id: id))
  end

  #def cart_products
    #cart.products
  #end

  def cart_total
    cart.total
  end

  def item(id:)
    default_products.find(id: id)
  end

  def default_cart
    Cart.new
  end

  def default_products
    to_return ||= Products.new
    to_return
  end
end
