module Groupby
  module Model
    class Record
      include Groupby::Model::Identifiable

      # string            @url
      # string            @snippet
      # string            @title
      # object[]          @all_meta
      # RefinementMatch[] @refinement_matches

      attr_accessor :url, :snippet, :title, :all_meta, :refinement_matches

      @all_meta = Array.new
      @refinement_matches = Array.new

    end
  end
end