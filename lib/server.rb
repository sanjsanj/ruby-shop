require 'sinatra/base'
require_relative 'models/products'
require_relative 'models/cart'
require_relative 'models/shop'

class RubyShop < Sinatra::Base
  enable :sessions

  set :views, proc { File.join(root, 'views') }
  set :public_folder, proc { File.join(root, '..', 'public') }

  set :session_secret, 'super secret'

  helpers do
    def partial(template, locals = {})
      erb template, :locals => locals
    end
  end

  get '/' do
    @shop ||= Shop.new(cart: Cart.new, products: Products.data)
    @products = @shop.products
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end
