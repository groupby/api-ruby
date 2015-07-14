module Groupby
  module Model
    class RichContentZone < AbstractContentZone

      def initialize
        @type = Type::RICH_CONTENT
      end

      def rich_content
        @content
      end

      def rich_content=(rich_content)
        @content = rich_content
      end

    end
  end
end