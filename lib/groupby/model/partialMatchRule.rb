module Groupby
  module Model
    class PartialMatchRule < Serializable

      # int  @terms
      # int  @terms_greater_than
      # int  @must_match
      # bool @percentage

      attr_accessor :terms, :terms_greater_than, :must_match, :percentage

    end
  end
end