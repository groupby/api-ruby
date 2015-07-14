module Groupby
  module Object

    OBJ_METADATA = Model::Metadata.new
    OBJ_METADATA.key = 'orange'
    OBJ_METADATA.value = 'apple'

    OBJ_PAGE_INFO = Model::PageInfo.new
    OBJ_PAGE_INFO.record_start = 20
    OBJ_PAGE_INFO.record_end = 50

    OBJ_CLUSTER_RECORD = Model::ClusterRecord.new
    OBJ_CLUSTER_RECORD.title = 'fubar'
    OBJ_CLUSTER_RECORD.url = 'example.com'
    OBJ_CLUSTER_RECORD.snippet = 'itty bit'

    OBJ_CLUSTER = Model::Cluster.new
    OBJ_CLUSTER.records = [OBJ_CLUSTER_RECORD]
    OBJ_CLUSTER.term = 'some'

    OBJ_REFINEMENT_RANGE = Model::RefinementRange.new
    OBJ_REFINEMENT_RANGE.id = '342h9582hh4'
    OBJ_REFINEMENT_RANGE.count = 14
    OBJ_REFINEMENT_RANGE.high = 'delicious'
    OBJ_REFINEMENT_RANGE.low = 'atrocious'
    OBJ_REFINEMENT_RANGE.exclude = true

    OBJ_REFINEMENT_VALUE = Model::RefinementValue.new
    OBJ_REFINEMENT_VALUE.id = 'fadfs89y10j'
    OBJ_REFINEMENT_VALUE.count = 987
    OBJ_REFINEMENT_VALUE.value = 'malaise'
    OBJ_REFINEMENT_VALUE.exclude = false

    OBJ_SORT = Model::Sort.new
    OBJ_SORT.order = Model::Sort::Order::DESCENDING
    OBJ_SORT.field = 'price'

    OBJ_NAVIGATION = Model::Navigation.new
    OBJ_NAVIGATION.id = '081h29n81f'
    OBJ_NAVIGATION.name = 'green'
    OBJ_NAVIGATION.display_name = 'GReeN'
    OBJ_NAVIGATION.or = false
    OBJ_NAVIGATION.type = Model::Navigation::Type::RANGE_DATE
    OBJ_NAVIGATION.range = true
    OBJ_NAVIGATION.sort = OBJ_SORT
    OBJ_NAVIGATION.metadata = [Object::OBJ_METADATA]
    OBJ_NAVIGATION.refinements = [OBJ_REFINEMENT_RANGE, OBJ_REFINEMENT_VALUE]
    OBJ_NAVIGATION.more_refinements = true

    OBJ_REFINEMENT_MATCH_VALUE = Model::RefinementMatch::Value.new
    OBJ_REFINEMENT_MATCH_VALUE.value = 'adverb'
    OBJ_REFINEMENT_MATCH_VALUE.count = 43

    OBJ_REFINEMENT_MATCH = Model::RefinementMatch.new
    OBJ_REFINEMENT_MATCH.name = 'grapheme'
    OBJ_REFINEMENT_MATCH.values = [OBJ_REFINEMENT_MATCH_VALUE]

    OBJ_RECORD = Model::Record.new
    OBJ_RECORD.id = 'fw90314jh289t'
    OBJ_RECORD.title = 'Periwinkle'
    OBJ_RECORD.snippet = 'Curator'
    OBJ_RECORD.url = 'exemplar.com'
    OBJ_RECORD.all_meta = {
        :look => 'at',
        :all => 'my',
        :keys => %w(we are the values)
    }
    OBJ_RECORD.refinement_matches = [OBJ_REFINEMENT_MATCH]

    OBJ_CONTENT_ZONE = Model::ContentZone.new
    OBJ_CONTENT_ZONE.id = '23425n89hr'
    OBJ_CONTENT_ZONE.name = 'porcelain'
    OBJ_CONTENT_ZONE.content = 'mushy'

    OBJ_BANNER_ZONE = Model::BannerZone.new
    OBJ_BANNER_ZONE.id = 'asf0j2380jf'
    OBJ_BANNER_ZONE.name = 'vitruvian'
    OBJ_BANNER_ZONE.banner_url = 'man'

    OBJ_RICH_CONTENT_ZONE = Model::RichContentZone.new
    OBJ_RICH_CONTENT_ZONE.id = 'f90j1e1rf'
    OBJ_RICH_CONTENT_ZONE.name = 'appalled'
    OBJ_RICH_CONTENT_ZONE.rich_content = 'crestfallen'

    OBJ_RECORD_ZONE = Model::RecordZone.new
    OBJ_RECORD_ZONE.id = '1240jfw9s8'
    OBJ_RECORD_ZONE.name = 'gorbachev'
    OBJ_RECORD_ZONE.records = [OBJ_RECORD]

    # noinspection RubyArgCount
    OBJ_TEMPLATE = Model::Template.new
    OBJ_TEMPLATE.id = 'fad87g114'
    OBJ_TEMPLATE.name = 'bulbous'
    OBJ_TEMPLATE.rule_name = 'carmageddon'
    OBJ_TEMPLATE.zones = [OBJ_CONTENT_ZONE, OBJ_RECORD_ZONE]

    OBJ_CUSTOM_URL_PARAM = Model::CustomUrlParam.new
    OBJ_CUSTOM_URL_PARAM.key = 'guava'
    OBJ_CUSTOM_URL_PARAM.value = 'mango'

    OBJ_RESTRICT_NAVIGATION = Request::RestrictNavigation.new
    OBJ_RESTRICT_NAVIGATION.count = 2
    OBJ_RESTRICT_NAVIGATION.name = 'categories'

    OBJ_PARTIAL_MATCH_RULE = Model::PartialMatchRule.new
    OBJ_PARTIAL_MATCH_RULE.must_match = 4
    OBJ_PARTIAL_MATCH_RULE.terms = 2
    OBJ_PARTIAL_MATCH_RULE.terms_greater_than = 45
    OBJ_PARTIAL_MATCH_RULE.percentage = true

    OBJ_MATCH_STRATEGY = Model::MatchStrategy.new
    OBJ_MATCH_STRATEGY.rules = [OBJ_PARTIAL_MATCH_RULE]

    OBJ_REQUEST = Request::Request.new
    OBJ_REQUEST.client_key = 'adf7h8er7h2r'
    OBJ_REQUEST.collection = 'ducks'
    OBJ_REQUEST.area = 'surface'
    OBJ_REQUEST.skip = 12
    OBJ_REQUEST.page_size = 30
    OBJ_REQUEST.biasing_profile = 'ballooning'
    OBJ_REQUEST.language = 'en'
    OBJ_REQUEST.prune_refinements = true
    OBJ_REQUEST.return_binary = false
    OBJ_REQUEST.query = 'cantaloupe'
    OBJ_REQUEST.refinement_query = 'cranberry'
    OBJ_REQUEST.sort = [OBJ_SORT]
    OBJ_REQUEST.fields = %w(pineapple grape clementine)
    OBJ_REQUEST.or_fields = %w(pumpernickel rye)
    OBJ_REQUEST.refinements = [OBJ_REFINEMENT_RANGE, OBJ_REFINEMENT_VALUE]
    OBJ_REQUEST.custom_url_params = [OBJ_CUSTOM_URL_PARAM]
    OBJ_REQUEST.wildcard_search_enabled = true
    OBJ_REQUEST.restrict_navigation = OBJ_RESTRICT_NAVIGATION
    OBJ_REQUEST.match_strategy = OBJ_MATCH_STRATEGY

    OBJ_REFINEMENTS_REQUEST = Request::RefinementsRequest.new
    OBJ_REFINEMENTS_REQUEST.original_query = OBJ_REQUEST
    OBJ_REFINEMENTS_REQUEST.navigation_name = 'height'

  end
end