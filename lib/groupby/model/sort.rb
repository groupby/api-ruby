module Groupby
  module Model
    class Sort

      module Order
        ASCENDING = 'Ascending'
        DESCENDING = 'Descending'
      end

      attr_accessor :field, :order

      RELEVANCE = Sort.new
      RELEVANCE.field = '_relevance'

      # string      @field
      # Sort::Order @order

      @order = Sort::Order::ASCENDING

    end
  end
end