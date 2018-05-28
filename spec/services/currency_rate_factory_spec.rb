require 'dotenv'
require_relative '../../app/services/currency_rate/currency_rate_factory'
require_relative '../../app/services/currency_rate/drivers/currency_layer_driver'

describe CurrencyRateFactory,"build" do
    context "O driver escolhido é o currencylayer" do
        it "Deve retornar uma instance de CurrencyLayerDriver" do
            currencyRateFactory = CurrencyRateFactory.build 'currencylayer', 'accesskey'
            expect(currencyRateFactory).to be_kind_of(CurrencyLayerDriver)
        end
    end
end
