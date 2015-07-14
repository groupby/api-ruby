require 'json'

module Groupby
  module Model
    class Serializable

      private def camelize(underscored)
        safe = underscored
        if underscored.start_with? '@'
          safe = underscored[1..-1]
        end
        safe[0] + safe.to_s.gsub(/\/(.?)/) { '::' + $1.upcase }.gsub(/(^|_)(.)/) { $2.upcase }[1..-1]
      end

      def to_json(dummy = false)
        JSON.generate(Hash[instance_variables.map { |name| [camelize(name.to_s), instance_variable_get(name)] }])
      end

    end
  end
end