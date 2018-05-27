require 'sinatra/base'

Dir.glob('./app/{services,controllers}/*.rb').each { |file| require file }

map('/') { run HomeController }