module Groupby
  module Request
    class Request < Model::Serializable

      # string               @client_key
      # string               @collection
      # string               @area
      # string               @biasing_profile
      # string               @language
      # string               @query
      # string               @refinement_query
      # Sort[]               @sort
      # string[]             @fields
      # string[]             @or_fields
      # SelectedRefinement[] @refinements
      # CustomUrlParam[]     @custom_url_params
      # int                  @skip
      # int                  @page_size
      # bool                 @return_binary
      # bool                 @disable_autocorrection
      # bool                 @prune_refinements
      # bool                 @wildcard_search_enabled
      # RestrictNavigation   @restrict_navigation
      # MatchStrategy        @match_strategy

      attr_accessor :client_key, :collection, :area, :biasing_profile, :language, :query, :refinement_query, :sort,
                    :fields, :or_fields, :refinements, :custom_url_params, :skip, :page_size, :return_binary,
                    :disable_autocorrection, :prune_refinements, :wildcard_search_enabled, :restrict_navigation,
                    :match_strategy

      @sort = Array.new
      @fields = Array.new
      @or_fields = Array.new
      @refinements = Array.new
      @custom_url_params = Array.new
      @prune_refinements = true
      @wildcard_search_enabled = false

    end
  end
end