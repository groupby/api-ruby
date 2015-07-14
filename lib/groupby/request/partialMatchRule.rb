module Groupby
  module Request
    class PartialMatchRule

      # int  @terms
      # int  @terms_greater_than
      # int  @must_match
      # bool @percentage

      attr_accessor :terms, :terms_greater_than, :must_match, :percentage

      @percentage = false

      def get_effective_greater_than
        if !defined? @terms
          @terms - 1
        elsif !defined? @terms_greater_than
          @terms_greater_than
        else
          nil
        end
      end

    end
  end
end