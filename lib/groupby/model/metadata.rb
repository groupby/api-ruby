require_relative '../util/hashStruct'

module Groupby
  module Model
    # string @key
    # string @value

    class Metadata < Struct.new(:key, :value)
      # include Groupby::Util::HashStruct

    end
  end
end