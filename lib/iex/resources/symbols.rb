module IEX
  module Resources
    class Symbols < Resource
      property 'symbol'
      property 'exchange'
      property 'name'
      property 'date'
      property 'type'
      property 'iex_id', from: 'iexId'
      property 'region'
      property 'currency'
      property 'enabled', from: 'isEnabled'
    end
  end
end
