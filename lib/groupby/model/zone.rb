require 'abstraction'
require_relative '../util/hashStruct'

module Groupby
  module Model
    # string @name

    class Zone < Struct.new(:name)
      include Groupby::Model::Identifiable
      # include Groupby::Util::HashStruct
      abstract

      module Type
        CONTENT = 'Content'
        RECORD = 'Record'
        BANNER = 'Banner'
        RICH_CONTENT = 'Rich_Content'
      end

      def initialize
        @type = nil
      end

      attr_reader :type

    end
  end
end