module Groupby
  module Model
    class Template < Serializable
      include Groupby::Model::Identifiable

      # string @name
      # string @rule_name
      # Zone[] @zones

      attr_accessor :name, :rule_name, :zones

      @zones = Array.new

    end
  end
end