module Groupby
  module Model
    class RichContentZone < AbstractContentZone

      def rich_content
        @content
      end

      def rich_content=(rich_content)
        @content = rich_content
      end

      @type = Zone::Type::RICH_CONTENT

    end
  end
end