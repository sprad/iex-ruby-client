module IEX
  module Resources
    class IntradayPrice < Resource
      property 'date', transform_with: ->(v) { Date.parse(v) }
      property 'minute'
      property 'label'
      property 'market_open', from: 'marketOpen'
      property 'market_close', from: 'marketClose'
      property 'market_high', from: 'marketHigh'
      property 'market_low', from: 'marketLow'
      property 'market_average', from: 'marketAverage'
      property 'market_volume', from: 'marketVolume'
      property 'market_notional', from: 'marketNotional'
      property 'market_number_of_trades', from: 'marketNumberOfTrades'
      property 'market_change_over_time', from: 'marketChangeOverTime'
      property 'high'
      property 'low'
      property 'open'
      property 'close'
      property 'average'
      property 'volume'
      property 'notional'
      property 'number_of_trades', from: 'numberOfTrades'
      property 'change_over_time', from: 'changeOverTime'
    end
  end
end
