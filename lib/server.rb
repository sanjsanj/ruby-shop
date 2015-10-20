require 'sinatra/base'
require_relative 'helpers'

require_relative 'models/products'
require_relative 'models/cart'
require_relative 'models/shop'

class RubyShop < Sinatra::Base
  helpers PartialHelper

  enable :sessions
  set :session_secret, 'super secret'

  shop ||= Shop.new
  cart = shop.cart

  set :views, proc { File.join(root, 'views') }
  set :public_folder, proc { File.join(root, '..', 'public') }

  get '/' do
    session[:cart_total] = shop.cart_total
    session[:products] = shop.shop_products
    erb :index
  end

  get '/cart' do
    session[:cart_total] = shop.cart_total
    session[:products] = shop.shop_products
    erb :cart
  end
  
  post '/cart' do
    shop.add_to_cart(id: params[:product_id].to_i)
    redirect to '/cart'
  end

  run! if app_file == $PROGRAM_NAME
end
