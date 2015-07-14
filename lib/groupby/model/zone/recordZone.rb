module Groupby
  module Model
    class RecordZone < Zone

      # Record[] @records

      attr_accessor :records

      def initialize
        @type = Type::RECORD
      end

    end
  end
end