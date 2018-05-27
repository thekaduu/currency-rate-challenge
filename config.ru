require 'sinatra/base'
require 'dotenv'

Dotenv.load
Dir.glob('./app/{services,controllers}/*.rb').each { |file| require file }

map('/api/v1/currencyrate') { run HomeController }