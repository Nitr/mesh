libdir = File.join(File.dirname(__FILE__))
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'config/environment'

#use Rack::Static, :urls => ['/swagger_ui'], index: 'index.html'
#use Rack::CommonLogger, Logger.new($stdout)

require 'rack/cors'
use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [ :get, :post, :put, :delete, :options ]
  end
end


run API
