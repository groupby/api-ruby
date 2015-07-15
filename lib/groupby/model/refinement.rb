require 'abstraction'

module Groupby
  module Model
    class Refinement < Serializable
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

      def initialize
        @exclude = false
      end

      # noinspection RubyResolve
      def is_range?
        @type == Type::RANGE
      end

      # abstract def to_tilde_string

    end
  end
end