require 'sinatra/base'
require_relative 'helpers/server_helpers'

require_relative 'models/products'
require_relative 'models/cart'
require_relative 'models/shop'

class RubyShop < Sinatra::Base
  helpers ServerHelpers

  enable :sessions

  shop = Shop.new
  cart = shop.cart

  set :views, proc { File.join(root, 'views') }
  set :public_folder, proc { File.join(root, '..', 'public') }

  set :session_secret, 'super secret'

  get '/' do
    @cart_total = shop.cart_total
    @products = shop.products
    erb :index
  end

  get '/cart' do
    @cart_total = shop.cart_total
    erb :cart
  end
  
  post '/cart' do
    shop.add_to_cart(id: params[:product_id].to_i)
    redirect to '/cart'
  end

  run! if app_file == $PROGRAM_NAME
end
