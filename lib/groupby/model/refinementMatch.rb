module Groupby
  module Model
    class RefinementMatch < Serializable

      class Value < Serializable

        # string @value
        # int    @count

        attr_accessor :value, :count

      end

      # string                   @name
      # RefinementMatch::Value[] @values

      attr_accessor :name, :values

    end
  end
end