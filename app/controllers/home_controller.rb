require 'date'
require 'net/http'

require_relative '../operations/currency_rate_operation'

class HomeController < ApplicationController
    get '/' do
        operation = CurrencyRateOperation.new
        dateRange = Date.today-6 .. Date.today
        operation.getQuotesWhereDateRange dateRange, ["BRL", "EUR"]
    end
end