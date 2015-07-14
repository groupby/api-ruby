module Groupby
  module Model
    class RefinementRange < Refinement

      # string @high
      # string @low

      attr_accessor :high, :low

      @type = Refinement::Type::RANGE

      def to_tilde_string
        ":#{@low}..#{@high}"
      end

    end
  end
end