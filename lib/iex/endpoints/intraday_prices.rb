module IEX
  module Endpoints
    module IntradayPrices
      def intraday_prices(symbol, options = {})
        get("stock/#{symbol}/intraday-prices", options).map do |data|
          IEX::Resources::IntradayPrice.new(data)
        end
      rescue Faraday::ResourceNotFound => e
        raise IEX::Errors::SymbolNotFoundError.new(symbol, e.response[:body])
      end

      def intraday_prices_batch(symbols = [], options)
        options.merge!({
          "symbols" => symbols.join(","),
          "types" => "intraday-prices"
        })

        {}.tap do |intraday_prices|
          get("stock/market/batch", options).each do |data|
            individual_intraday_prices = data.last["intraday-prices"].map do |intraday_price|
              IEX::Resources::IntradayPrice.new(intraday_price)
            end

            # Return a Hash of the Stock Symbol to its intraday prices
            intraday_prices[data.first] = individual_intraday_prices
          end
        end
      rescue Faraday::ResourceNotFound => e
        raise IEX::Errors::SymbolNotFoundError.new(symbol, e.response[:body])
      end
    end
  end
end
