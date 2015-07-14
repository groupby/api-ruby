module Groupby
  module Model
    class ClusterRecord < Serializable

      # string @title
      # string @url
      # string @snippet

      attr_accessor :title, :url, :snippet

    end
  end
end