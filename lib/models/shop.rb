require 'json'
require_relative 'cart'

class Shop
  attr_accessor :products, :cart

  def initialize
    file = File.read 'products.json'
    @products = JSON.parse file
    @cart = Cart.new
  end
end
