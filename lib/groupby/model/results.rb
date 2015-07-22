# require_relative '../util/hashStruct'
# require_relative 'template'
# require_relative 'pageInfo'
# require_relative 'record'
# require_relative 'navigation'
# require_relative 'metadata'
# require_relative 'cluster'
# require 'require_all'
# require_all 'lib'

module Groupby
  module Model
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

    class Results < Util::HashStruct.new(:total_record_count, :area, :biasing_profile, :redirect, :errors, :query, :original_query,
                                         :corrected_query, :template, :page_info, :available_navigation, :selected_navigation, :records,
                                         :did_you_mean, :related_queries, :rewrites, :site_params, :clusters)
      attr_types template: Template, page_info: PageInfo, records: [Record], available_navigation: [Navigation],
                 selected_navigation: [Navigation], site_params: [Metadata], clusters: [Cluster]

      # attr_accessor

      def initialize
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
end