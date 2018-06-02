require './app'
require 'sinatra/base'
require 'dotenv'
require 'controllers/home_controller'

Dotenv.load

map('/api/v1/currencyrate') { run HomeController }
