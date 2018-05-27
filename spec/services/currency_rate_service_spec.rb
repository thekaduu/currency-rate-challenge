require 'faker'
require_relative '../../app/services/currency_rate/currency_rate_facade'

describe CurrencyRateFacade,"whereBetween" do
    context "Os últimos 7 dias (contando com hoje)" do
        it "Deve retornar uma lista de objetos Quote" do
            rangeDates = Date.today-6 .. Date.today
            currencyRateFacade = CurrencyRateFacade.new

            currencyRateFacade.addCurrency('USD')
                .addCurrency('BRL')
                .addCurrency('EUR')

            currencies = currencyRateFacade.currencies

            response = currencyRateFacade.whereBetween rangeDates

            rangeDates.each do |date|
                dateFormatted = date.strftime("%Y-%m-%d")
                expect(response).to have_key dateFormatted
                expect(response[dateFormatted].length).to eq currencies.length

                response[dateFormatted].each do |quote|
                    expect(currencies).to include(quote.currency)
                end
            end
        end
    end
end