module IEX
  module Endpoints
    module Quote
      def quote(symbol, options = {})
        IEX::Resources::Quote.new(get("stock/#{symbol}/quote", options))
      rescue Faraday::ResourceNotFound => e
        raise IEX::Errors::SymbolNotFoundError.new(symbol, e.response[:body])
      end

      def quote_batch(symbols = [])
        options = {
          "symbols" => symbols.join(","),
          "types" => "quote"
        }
        get("stock/market/batch", options).map do |data|
          IEX::Resources::Quote.new(data.last["quote"])
        end
      rescue Faraday::ResourceNotFound => e
        raise IEX::Errors::SymbolNotFoundError.new(symbol, e.response[:body])
      end
    end
  end
end
