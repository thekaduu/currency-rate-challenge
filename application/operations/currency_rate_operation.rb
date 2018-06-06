require 'libs/currency_rate/currency_rate_facade'
require 'json'

# Classe responsavel por efetuar a consulta das taxas cambiais
class CurrencyRateOperation
  # Retorna uma lista de quotes baseada no array de moedas
  # passados por parametro e um range de datas
  # @param [DateRange]  data_range
  # @param [Array] array com as moedas que deseja a cotacao
  # @return [hash] com chave sendo uma data e o valor todas as cotacoes
  # para esta data
  def get_quotes_where_date_range(data_range, currencies)
    facade = CurrencyRateFacade.new ENV['ACCESS_KEY']
    currencies.each do |currency|
      facade.add_currency(currency)
    end
    result = {}
    facade.where_between(data_range).each do |date, quotes|
      quotes = quotes.map(&:to_hash)
      result[date] = quotes
    end
    result.to_json
  end
end
