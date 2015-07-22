module Groupby
  module Util
    module InheritableTypes

      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods

        def attr_types(*attrs)
          @types ||= Hash.new
          @types.update(attrs[0])
        end

        # Hash[:attr, Hash[:value, :class]]
        def attr_discriminators(*discrim)
          @discriminators ||= Hash.new
          @discriminators.update(discrim[0])
        end

        def inherited(subclass)
          type_list = "@#{:types}"
          subclass.instance_variable_set(type_list, instance_variable_get(type_list))
        end

      end

    end
  end
end