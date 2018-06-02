require 'controllers/application_controller'
require 'operations/currency_rate_operation'

class HomeController < ApplicationController

  get '/' do
    operation = CurrencyRateOperation.new
    date_range = (Date.today - 6)..Date.today
    operation.get_quotes_where_date_range(date_range, ['BRL', 'EUR'])
  end
end
