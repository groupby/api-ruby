module Groupby
  module Model
    # noinspection RubyTooManyInstanceVariablesInspection
    class Navigation
      include Groupby::Model::Identifiable

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

      # string           @name
      # Navigation::Type @type
      # Navigation::Sort @sort
      # string           @display_name
      # bool             @range
      # bool             @or
      # bool             @more_refinements
      # Refinement[]     @refinements
      # Metadata[]       @metadata

      attr_accessor :name, :type, :sort, :display_name, :range, :or, :more_refinements, :refinements, :metadata

      @range = false
      @or = false
      @more_refinements = false
      @refinements = Array.new
      @metadata = Array.new

    end
  end
end