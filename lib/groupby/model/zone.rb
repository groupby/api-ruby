require 'abstraction'

module Groupby
  module Model
    class Zone < Serializable
      include Groupby::Model::Identifiable
      abstract

      module Type
        CONTENT = 'Content'
        RECORD = 'Record'
        BANNER = 'Banner'
        RICH_CONTENT = 'Rich_Content'
      end

      # string @name

      attr_accessor :name
      attr_reader :type

      @type = nil

    end
  end
end