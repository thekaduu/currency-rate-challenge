require 'libs/currency_rate/currency_rate_factory'
require 'libs/currency_rate/drivers/currency_layer_driver'

describe CurrencyRateFactory, 'build' do
  context 'O driver escolhido é o currencylayer' do
    it 'Deve retornar uma instance de CurrencyLayerDriver' do
      currency_rate_factory = CurrencyRateFactory.build(
        'accesskey',
        'currency_layer'
      )

      expect(currency_rate_factory).to be_kind_of(CurrencyLayerDriver)
    end
  end
end
