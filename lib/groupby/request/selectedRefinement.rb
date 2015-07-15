require 'abstraction'

module Groupby
  module Request
    class SelectedRefinement
      include Groupby::Model::Identifiable
      abstract

      module Type
        RANGE = 'Range'
        VALUE = 'Value'
      end

      # string                   @navigation_name
      # bool                     @exclude
      # SelectedRefinement::Type @type

      attr_accessor :navigation_name, :exclude, :type

      def initialize
        @exclude = false
      end

      def is_range?
        @type == SelectedRefinement::Type::RANGE
      end

      # abstract def to_tilde_string

    end
  end
end