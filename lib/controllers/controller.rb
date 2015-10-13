require 'sinatra/base'

class RubyShop < Sinatra::Base
  get '/' do
    'Hello RubyShop!'
  end

  run! if app_file == $0
end
