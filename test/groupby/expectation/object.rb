require 'require_all'
require_all 'lib'

module Groupby
  module Object

    # METADATA = Model::Metadata.from_h(
    #     :key => 'orange',
    #     :value => 'apple'
    # )
    #
    # PAGE_INFO = Model::PageInfo.from_h(
    #     :record_start => 20,
    #     :record_end => 50
    # )
    #
    # CLUSTER_RECORD = Model::ClusterRecord.from_h(
    #     :title => 'fubar',
    #     :url => 'example.com',
    #     :snippet => 'itty bit'
    # )
    #
    # CLUSTER = Model::Cluster.from_h(
    #     :records => [CLUSTER_RECORD],
    #     :term => 'some'
    # )
    #
    # REFINEMENT_RANGE = Model::RefinementRange.from_h(
    #     :id => '342h9582hh4',
    #     :count => 14,
    #     :high => 'delicious',
    #     :low => 'atrocious',
    #     :exclude => true
    # )
    #
    # REFINEMENT_VALUE = Model::RefinementValue.from_h(
    #     :id => 'fadfs89y10j',
    #     :count => 987,
    #     :value => 'malaise',
    #     :exclude => false
    # )
    #
    # SORT = Model::Sort.new
    # SORT.order = Model::Sort::Order::DESCENDING
    # SORT.field = 'price'
    #
    # NAVIGATION = Model::Navigation.from_h(
    #     :id => '081h29n81f',
    #     :name => 'green',
    #     :display_name => 'GReeN',
    #     :or => false,
    #     :type => Model::Navigation::Type::RANGE_DATE,
    #     :range => true,
    #     :sort => SORT,
    #     :metadata => [Object::METADATA],
    #     :refinements => [REFINEMENT_RANGE, REFINEMENT_VALUE],
    #     :more_refinements => true
    # )
    #
    # REFINEMENT_MATCH_VALUE = Model::RefinementMatch::Value.from_h(
    #     :value => 'adverb',
    #     :count => 43
    # )
    #
    # REFINEMENT_MATCH = Model::RefinementMatch.from_h(
    #     :name => 'grapheme',
    #     :values => [REFINEMENT_MATCH_VALUE]
    # )
    #
    # RECORD = Model::Record.from_h(
    #     :id => 'fw90314jh289t',
    #     :title => 'Periwinkle',
    #     :snippet => 'Curator',
    #     :url => 'exemplar.com',
    #     :all_meta => {
    #         :look => 'at',
    #         :all => 'my',
    #         :keys => %w(we are the values)
    #     },
    #     :refinement_matches => [REFINEMENT_MATCH]
    # )
    #
    # CONTENT_ZONE = Model::ContentZone.new
    # CONTENT_ZONE.id = '23425n89hr'
    # CONTENT_ZONE.name = 'porcelain'
    # CONTENT_ZONE.content = 'mushy'
    #
    # BANNER_ZONE = Model::BannerZone.new
    # BANNER_ZONE.id = 'asf0j2380jf'
    # BANNER_ZONE.name = 'vitruvian'
    # BANNER_ZONE.banner_url = 'man'
    #
    # RICH_CONTENT_ZONE = Model::RichContentZone.new
    # RICH_CONTENT_ZONE.id = 'f90j1e1rf'
    # RICH_CONTENT_ZONE.name = 'appalled'
    # RICH_CONTENT_ZONE.rich_content = 'crestfallen'
    #
    # RECORD_ZONE = Model::RecordZone.new
    # RECORD_ZONE.id = '1240jfw9s8'
    # RECORD_ZONE.name = 'gorbachev'
    # RECORD_ZONE.records = [RECORD]
    #
    # # noinspection RubyArgCount
    # TEMPLATE = Model::Template.from_h(
    #     :id => 'fad87g114',
    #     :name => 'bulbous',
    #     :rule_name => 'carmageddon',
    #     :zones => [CONTENT_ZONE, RECORD_ZONE]
    # )
    #
    # CUSTOM_URL_PARAM = Model::CustomUrlParam.new
    # CUSTOM_URL_PARAM.key = 'guava'
    # CUSTOM_URL_PARAM.value = 'mango'
    #
    # RESTRICT_NAVIGATION = Request::RestrictNavigation.new
    # RESTRICT_NAVIGATION.count = 2
    # RESTRICT_NAVIGATION.name = 'categories'
    #
    # PARTIAL_MATCH_RULE = Model::PartialMatchRule.new
    # PARTIAL_MATCH_RULE.must_match = 4
    # PARTIAL_MATCH_RULE.terms = 2
    # PARTIAL_MATCH_RULE.terms_greater_than = 45
    # PARTIAL_MATCH_RULE.percentage = true
    #
    # MATCH_STRATEGY = Model::MatchStrategy.new
    # MATCH_STRATEGY.rules = [PARTIAL_MATCH_RULE]
    #
    # REQUEST = Request::Request.new
    # REQUEST.client_key = 'adf7h8er7h2r'
    # REQUEST.collection = 'ducks'
    # REQUEST.area = 'surface'
    # REQUEST.skip = 12
    # REQUEST.page_size = 30
    # REQUEST.biasing_profile = 'ballooning'
    # REQUEST.language = 'en'
    # REQUEST.prune_refinements = true
    # REQUEST.return_binary = false
    # REQUEST.query = 'cantaloupe'
    # REQUEST.refinement_query = 'cranberry'
    # REQUEST.sort = [SORT]
    # REQUEST.fields = %w(pineapple grape clementine)
    # REQUEST.or_fields = %w(pumpernickel rye)
    # REQUEST.refinements = [REFINEMENT_RANGE, REFINEMENT_VALUE]
    # REQUEST.custom_url_params = [CUSTOM_URL_PARAM]
    # REQUEST.wildcard_search_enabled = true
    # REQUEST.restrict_navigation = RESTRICT_NAVIGATION
    # REQUEST.match_strategy = MATCH_STRATEGY
    #
    # REFINEMENTS_REQUEST = Request::RefinementsRequest.new
    # REFINEMENTS_REQUEST.original_query = REQUEST
    # REFINEMENTS_REQUEST.navigation_name = 'height'
    #
    # RESULTS = Model::Results.from_h(
    #     :total_record_count => 34,
    #     :area => 'christmas',
    #     :biasing_profile => 'unbiased',
    #     :redirect => '/to/the/moon.html',
    #     :errors => 'criminey!',
    #     :query => 'skwuare',
    #     :original_query => 'skwuare---',
    #     :corrected_query => 'square',
    #     :template => Object::TEMPLATE,
    #     :page_info => Object::PAGE_INFO,
    #     :available_navigation => [Object::NAVIGATION],
    #     :selected_navigation => [Object::NAVIGATION],
    #     :records => [Object::RECORD],
    #     :did_you_mean => %w(square skewer),
    #     :related_queries => %w(squawk ask),
    #     :rewrites => %w(Synonym Antonym Homonym),
    #     :site_params => [Object::METADATA],
    #     :clusters => [Object::CLUSTER]
    # )
    #
    # REFINEMENTS_RESULT = Model::RefinementsResult.new
    # REFINEMENTS_RESULT.errors = 'Could not load'
    # REFINEMENTS_RESULT.navigation = Object::NAVIGATION

  end
end