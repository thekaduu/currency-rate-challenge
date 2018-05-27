require_relative '../services/currency_rate/currency_rate_facade'
require_relative '../services/currency_rate/models/quote'
require 'json'

class CurrencyRateOperation

    # Retorna uma lista de quotes baseada no array de moedas
    # passados por parametro e um range de datas
    #
    # @param [DateRange]  dateRange
    # @param [Array] array com as moedas que deseja a cotação
    # @return [hash] com chave sendo uma data e o valor todas as cotações para esta data
    def getQuotesWhereDateRange dateRange, currencies = ['USD', 'BRL', 'EUR']
        facade = CurrencyRateFacade.new

        currencies.each do |currency|
            facade.addCurrency(currency)
        end

        quotes = facade.whereBetween dateRange
        result = {}
        quotes.each do |date, cotacoes|
            cotacoes = cotacoes.map do |quote|
                quote.to_hash
            end
            result[date] = cotacoes
        end
        result.to_json
    end
end