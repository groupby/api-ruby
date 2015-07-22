require 'minitest/autorun'
require 'require_all'
require_rel 'expectation'

module Groupby
  class TestJsonDeserialize < Minitest::Test

    # def test_deserialize_ref_range
    #   assert_equal(Object::REFINEMENT_RANGE, Model::RefinementRange.from_json(Json::REFINEMENT_RANGE))
    # end
    #
    # def test_deserialize_ref_value
    #   assert_equal(Object::REFINEMENT_VALUE, Model::RefinementValue.from_json(Json::REFINEMENT_VALUE))
    # end
    #
    # def test_deserialize_metadata
    #   assert_equal(Object::METADATA, Model::Metadata.from_json(Json::METADATA))
    # end
    #
    # def test_deserialize_navigation
    #   assert_equal(Object::NAVIGATION, Model::Navigation.from_json(Json::NAVIGATION))
    # end
    #
    # def test_deserialize_cluster_rec
    #   assert_equal(Object::CLUSTER_RECORD, Model::ClusterRecord.from_json(Json::CLUSTER_RECORD))
    # end
    #
    # def test_deserialize_cluster
    #   assert_equal(Object::CLUSTER, Model::Cluster.from_json(Json::CLUSTER))
    # end
    #
    # def test_deserialize_ref_match_val
    #   assert_equal(Object::REFINEMENT_MATCH_VALUE, Model::RefinementMatch::Value.from_json(Json::REFINEMENT_MATCH_VALUE))
    # end
    #
    # def test_deserialize_ref_match
    #   assert_equal(Object::REFINEMENT_MATCH, Model::RefinementMatch.from_json(Json::REFINEMENT_MATCH))
    # end
    #
    # def test_deserialize_record
    #   assert_equal(Object::RECORD, Model::Record.from_json(Json::RECORD))
    # end
    #
    # def test_deserialize_page_info
    #   assert_equal(Object::PAGE_INFO, Model::PageInfo.from_json(Json::PAGE_INFO))
    # end
    #
    # def test_deserialize_content_zone
    #   assert_equal(Object::CONTENT_ZONE, Model::ContentZone.from_json(Json::CONTENT_ZONE))
    # end
    #
    # def test_deserialize_record_zone
    #   assert_equal(Object::RECORD_ZONE, Model::RecordZone.from_json(Json::RECORD_ZONE))
    # end
    #
    # def test_deserialize_banner_zone
    #   assert_equal(Object::BANNER_ZONE, Model::BannerZone.from_json(Json::BANNER_ZONE))
    # end
    #
    # def test_deserialize_rich_zone
    #   assert_equal(Object::RICH_CONTENT_ZONE, Model::RichContentZone.from_json(Json::RICH_CONTENT_ZONE))
    # end
    #
    # def test_deserialize_template
    #   assert_equal(Object::TEMPLATE, Model::Template.from_json(Json::TEMPLATE))
    # end
    #
    # def test_deserialize_restrict_nav
    #   assert_equal(Object::RESTRICT_NAVIGATION, Request::RestrictNavigation.from_json(Json::RESTRICT_NAVIGATION))
    # end

    def test_deserialize_results
      tess = Model::Results.new
      puts Model::Results.from_h(JSON.parse(Json::RESULTS))
      # assert_equal(Object::RESULTS, Model::Results.from_h(JSON.parse(Json::RESULTS)))
    end

    # def test_deserialize_refs_result
    #   refs_result = Model::RefinementsResult.from_json(Json::RESULTS)
    #   assert_equal(Object::REFINEMENTS_REQUEST, refs_result)
    #   assert(refs_result.navigation.class.is_a?(Model::RefinementsResult), 'wrong type')
    # end

  end
end