require 'controllers/application_controller'
require 'operations/currency_rate_operation'
require 'dotenv'

class CurrencyRateController < ApplicationController
  before do
    Dotenv.load
    headers 'Access-Control-Allow-Origin' => '*'
  end

  get '/api/v1/currencyrate' do
    operation = CurrencyRateOperation.new
    date_range = (Date.today - 6)..Date.today
    operation.get_quotes_where_date_range(date_range, ['BRL', 'EUR', 'ARS'])
  end
end
