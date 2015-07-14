module Groupby
  module Request
    class RefinementsRequest < Model::Serializable

      # Request @original_query
      # string  @navigation_name

      attr_accessor :original_query, :navigation_name

    end
  end
end