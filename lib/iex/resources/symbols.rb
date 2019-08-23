module IEX
  module Resources
    class Symbols < Resource
      property 'symbol'
      property 'exchange'
      property 'name'
      property 'date', transform_with: ->(v) { Date.parse(v) }
      property 'type'
      property 'iex_id', from: 'iexId'
      property 'region'
      property 'currency'
      property 'enabled', from: 'isEnabled'
    end
  end
end
