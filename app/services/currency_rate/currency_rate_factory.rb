require_relative './drivers/currency_layer_driver'
require 'dotenv'
Dotenv.load

=begin
    Cria uma instancia para consultar uma api de taxa de cambio
rescue => RuntimeError
=end
class CurrencyRateFactory

    def self.build driver = ENV['CURRENCY_RATE_DRIVER'], accessKey = ENV['ACCESS_KEY']
        driver    ||= 'currencylayer'

        unless accessKey || accessKey.to_s.empty?
            raise RuntimeError.new("Você precisa configurar seu .env com sua chave de acesso")
        end

        case driver
        when 'currencylayer'
            currencyRateInstance = CurrencyLayerDriver.new accessKey
        else
            currencyRateInstance = CurrencyLayerDriver.new accessKey
        end

        currencyRateInstance
    end

end