require 'libs/currency_rate/drivers/currency_layer_driver'

# Cria uma instancia para consultar uma api de taxa de cambio
# author Carlos Eduardo L Braz
class CurrencyRateFactory
  def self.build(access_key, driver = 'currency_layer')
    unless access_key || access_key.to_s.empty?
      raise 'Você precisa configurar seu .env com sua chave de acesso'
    end

    case driver
    when 'currency_layer'
      CurrencyLayerDriver.new access_key
    else
      raise 'Driver não encontrado'
    end
  end
end
