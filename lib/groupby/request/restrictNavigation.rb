module Groupby
  module Request
    class RestrictNavigation < Model::Serializable

      # string @name
      # int    @count

      attr_accessor :name, :count

    end
  end
end