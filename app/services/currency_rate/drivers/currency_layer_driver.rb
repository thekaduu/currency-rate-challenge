require 'json'
require 'net/http'
require_relative '../models/quote'

class CurrencyLayerDriver
    attr_accessor :currencies

    def initialize accessKey
        @uri = 'http://apilayer.net/api'

        @accessKey = accessKey
        @parametersRequest = {:access_key => @accessKey}
        @currencies = []
    end

    def whereDate date
        uri = "#{@uri}/historical?" + makeQueryString
        dateFormatted = date.strftime("%Y-%m-%d")
        uri += "&date=#{dateFormatted}"

        response = Net::HTTP.get_response(URI(uri))
        response.body if response.is_a?(Net::HTTPSuccess)
        to_quotes response.body
    end

    private
    def makeQueryString
        parameters = @parametersRequest
        parameters[:currencies] = @currencies.join(',')
        URI.encode_www_form(parameters)
    end

    def to_quotes body
        response = JSON.parse(body)
        date   = response['date']
        source = response['source']
        quotes = response['quotes']
        quotes = quotes.map do |currency, price|
            #removendo duplicidade do nome
            currencyFormatted = currency.sub(source, "")
            Quote.new currencyFormatted, price, date
        end
        quotes
    end


end