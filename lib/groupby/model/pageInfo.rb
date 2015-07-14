module Groupby
  module Model
    class PageInfo < Serializable

      # int @record_start
      # int @record_end

      attr_accessor :record_start, :record_end

    end
  end
end