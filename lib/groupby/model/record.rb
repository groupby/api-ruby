require_relative '../util/hashStruct'

module Groupby
  module Model
    # string            @url
    # string            @snippet
    # string            @title
    # object[]          @all_meta
    # RefinementMatch[] @refinement_matches

    class Record < Struct.new(:url, :snippet, :title, :all_meta, :refinement_matches)
      include Groupby::Model::Identifiable
      # include Groupby::Util::HashStruct

      def initialize
        @all_meta = Hash.new
        @refinement_matches = Array.new
      end

      protected def to_key(underscored)
        case underscored
          when '@url'
            '_u'
          when '@snippet'
            '_snippet'
          when '@title'
            '_t'
          else
            super(underscored)
        end
      end

    end
  end
end