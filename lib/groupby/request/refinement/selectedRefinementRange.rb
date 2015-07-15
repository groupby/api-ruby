module Groupby
  module Request
    class SelectedRefinementRange < SelectedRefinement

      # string @low
      # string @high

      attr_accessor :low, :high

      def initialize
        @type = Type::RANGE
      end

      # noinspection RubyResolve
      def to_tilde_string
        ":#{@low}..#{@high}"
      end

    end
  end
end