require 'sinatra/base'

class MainController < Sinatra::Base
  get "/" do
    "Works!"
  end
end