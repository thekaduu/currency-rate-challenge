require 'net/http'

class HomeController < ApplicationController
    get '/' do
        currency = Currencycle.new
        currency.getResult
    end
end