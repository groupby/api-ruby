module Groupby
  module Request
    class Sort

      module Order
        ASCENDING = 'Ascending'
        DESCENDING = 'Descending'
      end

      # string @field
      # Sort::Order @order = Sort::Order::ASCENDING

      attr_accessor :field, :order

      @order = Sort::Order::ASCENDING

    end
  end
end