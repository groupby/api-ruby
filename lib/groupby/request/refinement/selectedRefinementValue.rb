module Groupby
  module Request
    class SelectedRefinementValue < SelectedRefinement

      # string @value

      attr_accessor :value

      @type == SelectedRefinement::Type::VALUE

      # noinspection RubyResolve
      def to_tilde_string
        "=#{@value}"
      end

    end
  end
end