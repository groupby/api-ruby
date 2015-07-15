module Groupby
  module Request
    class SelectedRefinementValue < SelectedRefinement

      # string @value

      attr_accessor :value

      def initialize
        @type = Type::VALUE
      end

      # noinspection RubyResolve
      def to_tilde_string
        "=#{@value}"
      end

    end
  end
end