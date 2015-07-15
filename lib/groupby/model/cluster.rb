module Groupby
  module Model
    class Cluster < Serializable

      # string          @term
      # ClusterRecord[] @records

      attr_accessor :term, :records

      def initialize
        @records = Array.new
      end

    end
  end
end