module Groupby
  module Model
    class RefinementValue < Refinement

      # string @value

      attr_accessor :value

      def initialize
        @type = Type::VALUE
      end

      def to_tilde_string
        "=#{@value}"
      end

    end
  end
end