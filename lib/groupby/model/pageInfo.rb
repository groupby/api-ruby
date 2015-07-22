require_relative '../util/hashStruct'

module Groupby
  module Model
    # int @record_start
    # int @record_end

    class PageInfo < Struct.new(:record_start, :record_end)
      # include Groupby::Util::HashStruct
    end
  end
end