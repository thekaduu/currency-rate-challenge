require_relative 'currency_rate_factory'

class CurrencyRateFacade

    attr_reader :currencies

    def initialize
        @currencyRateService =  CurrencyRateFactory::build
        cleanParameters
    end

    def whereBetween rangeDates
        @currencyRateService.currencies = @currencies
        quotes = {}
        rangeDates.each do |date|
            dateFormatted         = date.strftime("%Y-%m-%d")
            quotes[dateFormatted] =  @currencyRateService.whereDate date
        end
        quotes
    end

    def addCurrency currency
        @currencies.push(currency)
        self
    end

    def cleanParameters
        @currencies = [];
    end

end