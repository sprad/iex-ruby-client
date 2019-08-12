module IEX
  module Endpoints
    module Symbols
      def symbols
        get("ref-data/symbols").map do |data|
          IEX::Resources::Symbols.new(data)
        end
      end
    end
  end
end
