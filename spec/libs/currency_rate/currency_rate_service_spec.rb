require 'libs/currency_rate/currency_rate_facade'

describe CurrencyRateFacade, 'where_between' do
  context 'Os últimos 7 dias (contando com hoje)' do
    it 'Deve retornar uma lista de objetos Quote' do
      range_dates = (Date.today - 6)..Date.today
      currency_rate_facade = CurrencyRateFacade.new(ENV['ACCESS_KEY'])

      currency_rate_facade.add_currency('USD')
                          .add_currency('BRL')
                          .add_currency('EUR')

      currencies = currency_rate_facade.currencies
      response = currency_rate_facade.where_between range_dates

      range_dates.each do |date|
        formatted_date = date.strftime('%Y-%m-%d')
        expect(response).to have_key formatted_date
        expect(response[formatted_date].length).to eq currencies.length

        response[formatted_date].each do |quote|
          expect(currencies).to include(quote.currency)
        end
      end
    end
  end
end