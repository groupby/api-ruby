module Groupby
  module Model
    class Cluster < Serializable

      # string          @term
      # ClusterRecord[] @records

      attr_accessor :term, :records

      @records = Array.new

    end
  end
end