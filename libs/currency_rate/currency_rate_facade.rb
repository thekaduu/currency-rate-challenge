require 'libs/currency_rate/currency_rate_factory'

# Façade para a aplicação acessar os drivers
# Carlos Eduardo L. Braz
class CurrencyRateFacade
  attr_reader :currencies

  def initialize(access_key)
    @currency_rate = CurrencyRateFactory.build(access_key)
    @currencies = []
  end

  def where_between(range_dates)
    @currency_rate.currencies = @currencies
    quotes = {}
    range_dates.each do |date|
      formatted_date = date.strftime('%Y-%m-%d')
      quotes[formatted_date] = @currency_rate.where_date date
    end
    quotes
  end

  def add_currency(currency)
    @currencies.push currency
    self
  end
end
