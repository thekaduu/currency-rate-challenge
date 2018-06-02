require 'json'
require 'net/http'
require 'libs/currency_rate/models/quote'

# Driver da apilayer
# author Carlos Eduardo L. Braz
class CurrencyLayerDriver
  attr_accessor :currencies

  def initialize(access_key)
    @uri = 'http://apilayer.net/api'

    @access_key = access_key
    @request_parameters = {access_key: @access_key}
    @currencies = []
  end

  def where_date(date)
    formatted_date = date.strftime '%Y-%m-%d'
    uri = "#{@uri}/historical?" + make_query_string + "&date=#{formatted_date}"
    response = Net::HTTP.get_response(URI(uri))
    response_hash = JSON.parse response.body
    if response_hash['succecss'] == 'false'
      error_message = "Ocorreu o seguinte error:  #{response_hash['error']['info']}"
      raise error_message
    else
      to_quotes response_hash
    end
  end

  private

  def make_query_string
    parameters = @request_parameters
    parameters[:currencies] = @currencies.join ','
    URI.encode_www_form(parameters)
  end

  def to_quotes(response_hash)
    date = response_hash['date']
    source = response_hash['source']
    quotes = response_hash['quotes'].map do |currency, price|
      # removendo duplicidade do nome
      formatted_currency = currency.sub(source, '')
      Quote.new(formatted_currency, price, date)
    end
    quotes
  end
end
