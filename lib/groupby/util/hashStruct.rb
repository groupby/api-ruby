require_relative 'inheritableTypes'
require_relative 'stringUtil'
require 'require_all'

module Groupby
  module Util
    class HashStruct

      def self.new(*attrs)
        hash_struct = Class.new(BaseStruct) do
        end
        hash_struct.typify(*attrs)
        hash_struct
      end

      class BaseStruct
        include Groupby::Util::InheritableTypes

        class << self

          def from_h(args)
            puts types
            instance = self.new
            args.each do |k, v|
              sym_k = StringUtil.underscore(k).to_sym
              instance.send("#{sym_k}=", coerce(sym_k, v)) if args.is_a? Hash
            end
            instance
          end

          private def coerce(k, v)
            if types.has_key?(k)
              @types[k].class == Array ? coerce_array(v, @types[k][0]) : @types[k].from_h(v)
            else
              v
            end
          end

          private def coerce_array(array, type)
            puts type
            final = []
            array.each { |object| final.append type.from_h(object) }
            final
          end

          def typify(*attrs)
            attrs.each { |attr| attr_accessor attr }
          end
        end

        def initialize
          require_all 'lib/model'
        end

      end

    end
  end
end