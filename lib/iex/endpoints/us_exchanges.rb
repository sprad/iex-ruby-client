module IEX
  module Endpoints
    module USExchanges
      def us_exchanges
        get("ref-data/market/us/exchanges").map do |data|
          IEX::Resources::USExchanges.new(data)
        end
      end
    end
  end
end
