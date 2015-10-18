require 'sinatra/base'
require_relative 'helpers/server_helpers'

require_relative 'models/products'
require_relative 'models/cart'
require_relative 'models/shop'

class RubyShop < Sinatra::Base
  helpers ServerHelpers

  enable :sessions

  set :views, proc { File.join(root, 'views') }
  set :public_folder, proc { File.join(root, '..', 'public') }

  set :session_secret, 'super secret'

  get '/' do
    shop ||= Shop.new
    @products = shop.products
    cart = shop.cart
    session[:cart_total] = shop.cart_total
    erb :index
  end

  get '/cart' do
    erb :cart
  end
  
  post '/cart' do
    erb :cart
  end

  run! if app_file == $PROGRAM_NAME
end
