require_relative '../util/hashStruct'

module Groupby
  module Model
    # string @title
    # string @url
    # string @snippet

    class ClusterRecord < Struct.new(:title, :url, :snippet)
      # include Groupby::Util::HashStruct

    end
  end
end