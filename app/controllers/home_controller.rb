require 'net/http'

class HomeController < ApplicationController
    get '/' do
        "Hello World"
    end
end