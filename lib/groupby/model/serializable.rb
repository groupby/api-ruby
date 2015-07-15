require 'abstraction'
require 'json'
require 'active_support/rails'

module Groupby
  module Model
    class Serializable
      abstract

      protected def to_key(underscored)
        case underscored
          when '@id'
            '_id'
          else
            safe = underscored

            if underscored.start_with? '@'
              safe = underscored[1..-1]
            end

            safe[0] + safe.to_s.gsub(/\/(.?)/) { '::' + $1.upcase }.gsub(/(^|_)(.)/) { $2.upcase }[1..-1]
        end
      end

      def self.to_attribute(camel_cased)
        safe = camel_cased

        if camel_cased.start_with? '_'
          safe = camel_cased[1..-1]
        end

        '@' + safe.gsub(/::/, '/').gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2').gsub(/([a-z\d])([A-Z])/, '\1_\2').
            tr('-', '_').downcase
      end

      def to_json(*dummy_args)
        hash = Hash[instance_variables.map { |name| [to_key(name.to_s), instance_variable_get(name)] }]
        hash.delete_if { |k, v| v.nil? }
        JSON.generate(hash)
      end

      def self.from_json(json)
        obj = self.new
        JSON.parse(json).each { |key, value| obj.instance_variable_set(to_attribute(key), value) }
        obj
      end

      def ==(other)
        equal = true
        instance_variables.map { |name| equal && instance_variable_get(name) == other.instance_variable_get(name) }
      end


    end
  end
end