module IEX
  module Resources
    class USExchanges < Resource
      property 'mic'
      property 'name'
      property 'long_name', from: 'longName'
      property 'tape_id', from: 'tapeId'
      property 'oats_id', from: 'oatsId'
      property 'ref_id', from: 'refId'
      property 'type'
    end
  end
end
