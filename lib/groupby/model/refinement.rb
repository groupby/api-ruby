require 'abstraction'

module Groupby
  module Model
    class Refinement
      include Groupby::Model::Identifiable
      abstract

      module Type
        RANGE = 'Range'
        VALUE = 'Value'
      end

      # int              @count
      # bool             @exclude
      # Refinement::Type @type

      attr_accessor :count, :exclude, :type

      @exclude = false

      # noinspection RubyResolve
      def is_range?
        @type == Refinement::Type::RANGE
      end

      # abstract def to_tilde_string

    end
  end
end