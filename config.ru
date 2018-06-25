require './app/controllers/main_controller'
require 'rack-proxy'

class AppProxy < Rack::Proxy
  def rewrite_env(env)
    env['HTTP_HOST'] = 'localhost:8888'
    env
  end
end

run Rack::URLMap.new(
  '/api' => MainController,
  '/'      => AppProxy.new
)