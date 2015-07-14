module Groupby
  module Model
    class BannerZone < AbstractContentZone

      def initialize
        @type = Type::BANNER
      end

      def banner_url
        @content
      end

      def banner_url=(banner_url)
        @content = banner_url
      end

    end
  end
end