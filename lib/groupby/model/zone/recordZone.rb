module Groupby
  module Model
    class RecordZone < Zone

      # Record[] @records

      attr_accessor :records

      @type = Zone::Type::RECORD

    end
  end
end