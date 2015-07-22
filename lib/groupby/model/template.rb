require_relative '../util/hashStruct'

module Groupby
  module Model
    # string @name
    # string @rule_name
    # Zone[] @zones

    class Template < Struct.new(:name, :rule_name, :zones)
      include Groupby::Model::Identifiable
      # include Groupby::Util::HashStruct

      def initialize
        @zones = Array.new
      end

    end
  end
end