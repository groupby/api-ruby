module Groupby
  module Model
    class RefinementRange < Refinement

      # string @high
      # string @low

      attr_accessor :high, :low

      def initialize
        @type = Type::RANGE
      end

      def to_tilde_string
        ":#{@low}..#{@high}"
      end

    end
  end
end