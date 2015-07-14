module Groupby
  module Model
    class RefinementValue < Refinement

      # string @value

      attr_accessor :value

      @value = Refinement::Type::VALUE

      def to_tilde_string
        "=#{@value}"
      end

    end
  end
end