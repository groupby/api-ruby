module Groupby
  module Model
    class Results

      # int          @total_record_count
      # string       @area
      # string       @biasing_profile
      # string       @redirect
      # string       @errors
      # string       @query
      # string       @original_query
      # string       @corrected_query
      # Template     @template
      # PageInfo     @page_info
      # Navigation[] @available_navigation
      # Navigation[] @selected_navigation
      # Record[]     @records
      # string[]     @did_you_mean
      # string[]     @related_queries
      # string[]     @rewrites
      # Metadata[]   @site_params
      # Cluster[]    @clusters

      attr_accessor :total_record_count, :area, :biasing_profile, :redirect, :errors, :query, :original_query,
                    :corrected_query, :template, :page_info, :available_navigation, :selected_navigation, :records,
                    :did_you_mean, :related_queries, :rewrites, :site_params, :clusters

      @available_navigation = Array.new
      @selected_navigation = Array.new
      @records = Array.new
      @did_you_mean = Array.new
      @related_queries = Array.new
      @rewrites = Array.new
      @site_params = Array.new
      @clusters = Array.new

    end
  end
end