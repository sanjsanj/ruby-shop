require 'sinatra/base'
require 'sinatra/partial'
# require 'sinatra/json'

require_relative 'models/shop'

class RubyShop < Sinatra::Base
  enable :sessions

  set :views, proc { File.join(root, 'views') }
  set :public_folder, proc { File.join(root, '..', 'public') }

  set :session_secret, 'super secret'
  set :partial_template_engine, :erb

  get '/' do
    @shop ||= Shop.new
    @products = @shop.products
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end
