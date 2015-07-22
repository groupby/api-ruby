require_relative '../util/hashStruct'

module Groupby
  module Model
    # string                   @name
    # RefinementMatch::Value[] @values

    class RefinementMatch < Struct.new(:name, :values)
      # include Groupby::Util::HashStruct

      # string @value
      # int    @count

      class Value < Struct.new(:value, :count)
        # include Groupby::Util::HashStruct

      end

    end
  end
end