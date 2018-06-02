# Representa a cotaçao de uma moeda
# author Carlos Eduardo L. Braz
class Quote
  attr_reader :currency, :price, :date

  def initialize(currency, price, date)
    @currency = currency
    @price = price
    @date = date
  end

  def to_hash
    { currency: @currency, price: @price, date: @date }
  end
end
