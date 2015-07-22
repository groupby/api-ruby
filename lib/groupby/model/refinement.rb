# require 'abstraction'
# require 'require_all'
# require_all 'lib'

module Groupby
  module Model
    # int              @count
    # bool             @exclude
    # Refinement::Type @type

    class Refinement < Util::HashStruct.new(:count, :exclude, :type)
      include Groupby::Model::Identifiable
      abstract

      attr_discriminators type: { Type::RANGE => Groupby::Model::RefinementRange, Type::VALUE => Groupby::Model::RefinementValue }

      module Type
        RANGE = 'Range'
        VALUE = 'Value'
      end

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