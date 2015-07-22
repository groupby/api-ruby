# require_relative '../util/hashStruct'
# require_relative 'metadata'
# require_relative 'refinement'

module Groupby
  module Model
    # string           @name
    # Navigation::Type @type
    # Navigation::Sort @sort
    # string           @display_name
    # bool             @range
    # bool             @or
    # bool             @more_refinements
    # Refinement[]     @refinements
    # Metadata[]       @metadata

    class Navigation < Util::HashStruct.new(:name, :type, :sort, :display_name, :range, :or, :more_refinements, :refinements, :metadata)
      include Groupby::Model::Identifiable
      attr_types metadata: [Model::Metadata], refinements: [Model::Refinement]

      module Order
        COUNT_ASCENDING = 'Count_Ascending'
        COUNT_DESCENDING = 'Count_Descending'
        VALUE_ASCENDING = 'Value_Ascending'
        VALUE_DESCENDING = 'Value_Descending'
      end

      module Type
        DATE = 'Date'
        FLOAT = 'Float'
        INTEGER = 'Integer'
        STRING = 'String'
        RANGE_DATE = 'Range_Date'
        RANGE_INTEGER = 'Range_Integer'
        RANGE_FLOAT = 'Range_Float'
      end

      def initialize
        super
        @range = false
        @or = false
        @more_refinements = false
        @refinements = Array.new
        @metadata = Array.new
      end

    end
  end
end