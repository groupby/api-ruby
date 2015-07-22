module Groupby
  module Model
    # string          @term
    # ClusterRecord[] @records

    class Cluster < Struct.new(:term, :records)
      # include Groupby::Util::HashStruct

      # @structs = {
      #     :records => Record
      # }

      def initialize
        @records = Array.new
      end

    end
  end
end