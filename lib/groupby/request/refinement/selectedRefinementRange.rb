module Groupby
  module Request
    class SelectedRefinementRange < SelectedRefinement

      # string @low
      # string @high

      attr_accessor :low, :high

      @type == SelectedRefinement::Type::RANGE

      # noinspection RubyResolve
      def to_tilde_string
        ":#{@low}..#{@high}"
      end

    end
  end
end