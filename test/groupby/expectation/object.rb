require 'require_all'
require_all 'lib/groupby/model'
require_all 'lib/groupby/request'

module Groupby
  module Object

    METADATA = Model::Metadata.new
    METADATA.key = 'orange'
    METADATA.value = 'apple'

    PAGE_INFO = Model::PageInfo.new
    PAGE_INFO.record_start = 20
    PAGE_INFO.record_end = 50

    CLUSTER_RECORD = Model::ClusterRecord.new
    CLUSTER_RECORD.title = 'fubar'
    CLUSTER_RECORD.url = 'example.com'
    CLUSTER_RECORD.snippet = 'itty bit'

    CLUSTER = Model::Cluster.new
    CLUSTER.records = [CLUSTER_RECORD]
    CLUSTER.term = 'some'

    REFINEMENT_RANGE = Model::RefinementRange.new
    REFINEMENT_RANGE.id = '342h9582hh4'
    REFINEMENT_RANGE.count = 14
    REFINEMENT_RANGE.high = 'delicious'
    REFINEMENT_RANGE.low = 'atrocious'
    REFINEMENT_RANGE.exclude = true

    REFINEMENT_VALUE = Model::RefinementValue.new
    REFINEMENT_VALUE.id = 'fadfs89y10j'
    REFINEMENT_VALUE.count = 987
    REFINEMENT_VALUE.value = 'malaise'
    REFINEMENT_VALUE.exclude = false

    SORT = Model::Sort.new
    SORT.order = Model::Sort::Order::DESCENDING
    SORT.field = 'price'

    NAVIGATION = Model::Navigation.new
    NAVIGATION.id = '081h29n81f'
    NAVIGATION.name = 'green'
    NAVIGATION.display_name = 'GReeN'
    NAVIGATION.or = false
    NAVIGATION.type = Model::Navigation::Type::RANGE_DATE
    NAVIGATION.range = true
    NAVIGATION.sort = SORT
    NAVIGATION.metadata = [Object::METADATA]
    NAVIGATION.refinements = [REFINEMENT_RANGE, REFINEMENT_VALUE]
    NAVIGATION.more_refinements = true

    REFINEMENT_MATCH_VALUE = Model::RefinementMatch::Value.new
    REFINEMENT_MATCH_VALUE.value = 'adverb'
    REFINEMENT_MATCH_VALUE.count = 43

    REFINEMENT_MATCH = Model::RefinementMatch.new
    REFINEMENT_MATCH.name = 'grapheme'
    REFINEMENT_MATCH.values = [REFINEMENT_MATCH_VALUE]

    RECORD = Model::Record.new
    RECORD.id = 'fw90314jh289t'
    RECORD.title = 'Periwinkle'
    RECORD.snippet = 'Curator'
    RECORD.url = 'exemplar.com'
    RECORD.all_meta = {
        :look => 'at',
        :all => 'my',
        :keys => %w(we are the values)
    }
    RECORD.refinement_matches = [REFINEMENT_MATCH]

    CONTENT_ZONE = Model::ContentZone.new
    CONTENT_ZONE.id = '23425n89hr'
    CONTENT_ZONE.name = 'porcelain'
    CONTENT_ZONE.content = 'mushy'

    BANNER_ZONE = Model::BannerZone.new
    BANNER_ZONE.id = 'asf0j2380jf'
    BANNER_ZONE.name = 'vitruvian'
    BANNER_ZONE.banner_url = 'man'

    RICH_CONTENT_ZONE = Model::RichContentZone.new
    RICH_CONTENT_ZONE.id = 'f90j1e1rf'
    RICH_CONTENT_ZONE.name = 'appalled'
    RICH_CONTENT_ZONE.rich_content = 'crestfallen'

    RECORD_ZONE = Model::RecordZone.new
    RECORD_ZONE.id = '1240jfw9s8'
    RECORD_ZONE.name = 'gorbachev'
    RECORD_ZONE.records = [RECORD]

    # noinspection RubyArgCount
    TEMPLATE = Model::Template.new
    TEMPLATE.id = 'fad87g114'
    TEMPLATE.name = 'bulbous'
    TEMPLATE.rule_name = 'carmageddon'
    TEMPLATE.zones = [CONTENT_ZONE, RECORD_ZONE]

    CUSTOM_URL_PARAM = Model::CustomUrlParam.new
    CUSTOM_URL_PARAM.key = 'guava'
    CUSTOM_URL_PARAM.value = 'mango'

    RESTRICT_NAVIGATION = Request::RestrictNavigation.new
    RESTRICT_NAVIGATION.count = 2
    RESTRICT_NAVIGATION.name = 'categories'

    PARTIAL_MATCH_RULE = Model::PartialMatchRule.new
    PARTIAL_MATCH_RULE.must_match = 4
    PARTIAL_MATCH_RULE.terms = 2
    PARTIAL_MATCH_RULE.terms_greater_than = 45
    PARTIAL_MATCH_RULE.percentage = true

    MATCH_STRATEGY = Model::MatchStrategy.new
    MATCH_STRATEGY.rules = [PARTIAL_MATCH_RULE]

    REQUEST = Request::Request.new
    REQUEST.client_key = 'adf7h8er7h2r'
    REQUEST.collection = 'ducks'
    REQUEST.area = 'surface'
    REQUEST.skip = 12
    REQUEST.page_size = 30
    REQUEST.biasing_profile = 'ballooning'
    REQUEST.language = 'en'
    REQUEST.prune_refinements = true
    REQUEST.return_binary = false
    REQUEST.query = 'cantaloupe'
    REQUEST.refinement_query = 'cranberry'
    REQUEST.sort = [SORT]
    REQUEST.fields = %w(pineapple grape clementine)
    REQUEST.or_fields = %w(pumpernickel rye)
    REQUEST.refinements = [REFINEMENT_RANGE, REFINEMENT_VALUE]
    REQUEST.custom_url_params = [CUSTOM_URL_PARAM]
    REQUEST.wildcard_search_enabled = true
    REQUEST.restrict_navigation = RESTRICT_NAVIGATION
    REQUEST.match_strategy = MATCH_STRATEGY

    REFINEMENTS_REQUEST = Request::RefinementsRequest.new
    REFINEMENTS_REQUEST.original_query = REQUEST
    REFINEMENTS_REQUEST.navigation_name = 'height'

    RESULTS = Model::Results.new
    RESULTS.area = 'christmas'
    RESULTS.clusters = [Object::CLUSTER]
    RESULTS.available_navigation = [Object::NAVIGATION]
    RESULTS.did_you_mean = %w(square skewer)
    RESULTS.errors = 'criminey!'
    RESULTS.page_info = Object::PAGE_INFO
    RESULTS.query = 'skwuare'
    RESULTS.records = [Object::RECORD]
    RESULTS.redirect = '/to/the/moon.html'
    RESULTS.selected_navigation = [Object::NAVIGATION]
    RESULTS.template = Object::TEMPLATE
    RESULTS.site_params = [Object::METADATA]
    RESULTS.related_queries = %w(squawk ask)
    RESULTS.rewrites = %w(Synonym Antonym Homonym)
    RESULTS.total_record_count = 34

    REFINEMENTS_RESULT = Model::RefinementsResult.new
    REFINEMENTS_RESULT.errors = 'Could not load'
    REFINEMENTS_RESULT.navigation = Object::NAVIGATION

  end
end