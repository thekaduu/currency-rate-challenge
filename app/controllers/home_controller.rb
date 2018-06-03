require 'controllers/application_controller'
require 'operations/currency_rate_operation'

class HomeController < ApplicationController

  get '/' do
    headers 'Access-Control-Allow-Origin' => '*'
    operation = CurrencyRateOperation.new
    date_range = (Date.today - 6)..Date.today
    operation.get_quotes_where_date_range(date_range, ['BRL', 'EUR', 'ARS'])
  end
end
