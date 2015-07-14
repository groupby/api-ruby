module Groupby
  module Model
    class Sort < Serializable

      module Order
        ASCENDING = 'Ascending'
        DESCENDING = 'Descending'
      end

      attr_accessor :field, :order

      RELEVANCE = Sort.new
      RELEVANCE.field = '_relevance'

      # string      @field
      # Sort::Order @order

      def initialize
        @order = Order::ASCENDING
      end

    end
  end
end