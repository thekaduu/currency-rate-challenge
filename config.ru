$LOAD_PATH.unshift(File.expand_path('.', __dir__))
$LOAD_PATH.unshift(File.expand_path('app', __dir__))

require 'app\controllers\currency_rate_controller'

run CurrencyRateController
