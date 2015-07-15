require 'minitest/autorun'
require 'require_all'
require_rel 'expectation'

module Groupby
  class TestJsonSerialize < Minitest::Test

    def test_encode_page_info
      assert_equal(Json::PAGE_INFO, Object::PAGE_INFO.to_json)
    end

    def test_encode_cluster
      assert_equal(Json::CLUSTER, Object::CLUSTER.to_json)
    end

    def test_encode_cluster_record
      assert_equal(Json::CLUSTER_RECORD, Object::CLUSTER_RECORD.to_json)
    end

    def test_encode_custom_url_param
      assert_equal(Json::CUSTOM_URL_PARAM, Object::CUSTOM_URL_PARAM.to_json)
    end

    def test_encode_metadata
      assert_equal(Json::METADATA, Object::METADATA.to_json)
    end

    def test_encode_navigation
      assert_equal(Json::NAVIGATION, Object::NAVIGATION.to_json)
    end

    def test_encode_ref_match_value
      assert_equal(Json::REFINEMENT_MATCH_VALUE, Object::REFINEMENT_MATCH_VALUE.to_json)
    end

    def test_encode_ref_match
      assert_equal(Json::REFINEMENT_MATCH, Object::REFINEMENT_MATCH.to_json)
    end

    def test_encode_record
      assert_equal(Json::RECORD, Object::RECORD.to_json)
    end

    def test_encode_ref_range
      assert_equal(Json::REFINEMENT_RANGE, Object::REFINEMENT_RANGE.to_json)
    end

    def test_encode_ref_value
      assert_equal(Json::REFINEMENT_VALUE, Object::REFINEMENT_VALUE.to_json)
    end

    def test_encode_content_zone
      assert_equal(Json::CONTENT_ZONE, Object::CONTENT_ZONE.to_json)
    end

    def test_encode_banner_zone
      assert_equal(Json::BANNER_ZONE, Object::BANNER_ZONE.to_json)
    end

    def test_encode_rich_content_zone
      assert_equal(Json::RICH_CONTENT_ZONE, Object::RICH_CONTENT_ZONE.to_json)
    end

    def test_encode_record_zone
      assert_equal(Json::RECORD_ZONE, Object::RECORD_ZONE.to_json)
    end

    def test_encode_sort
      assert_equal(Json::SORT, Object::SORT.to_json)
    end

    def test_encode_template
      assert_equal(Json::TEMPLATE, Object::TEMPLATE.to_json)
    end

    def test_encode_restrict_nav
      assert_equal(Json::RESTRICT_NAVIGATION, Object::RESTRICT_NAVIGATION.to_json)
    end

    def test_encode_partial_match_rule
      assert_equal(Json::PARTIAL_MATCH_RULE, Object::PARTIAL_MATCH_RULE.to_json)
    end

    def test_encode_match_strategy
      assert_equal(Json::MATCH_STRATEGY, Object::MATCH_STRATEGY.to_json)
    end

    def test_encode_request
      assert_equal(Json::REQUEST, Object::REQUEST.to_json)
    end

    def test_encode_refs_request
      assert_equal(Json::REFINEMENTS_REQUEST, Object::REFINEMENTS_REQUEST.to_json)
    end

  end
end
