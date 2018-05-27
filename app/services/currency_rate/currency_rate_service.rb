require 'net/http'
class CurrencyRateService

    def getResult
        uri = URI('http://apilayer.net/api/historical?access_key=25f658d772c6ccb7b94d0076ad9b938a&date=2005-02-01&')
        res = Net::HTTP.get_response(uri)
        res.body if res.is_a?(Net::HTTPSuccess)
    end
end