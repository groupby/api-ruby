require 'require_all'
require_all 'lib'
require 'minitest/autorun'
require 'minitest/mock'
require 'net/http'

module Groupby
  class TestBridge < Minitest::Test

    CLIENT_KEY = 'randomkey'
    HOST = 'localhost'
    PORT = 8080
    SEARCH_URL = 'http://localhost:8080/search'
    REFINEMENT_SEARCH_URL = 'http://localhost:8080/search/refinements'
    HEADERS = "Status 200\r\nContent-Type:application/json\n"
    TEST_QUERY = '{"clientKey":"randomkey","pruneRefinements":true,"sort":[],"fields":[],"orFields":[],"refinements":[],"customUrlParams":[],"skip":0,"pageSize":10,"wildcardSearchEnabled":false}'
    TEST_RESPONSE = '{"query":"foobar","pageInfo":{"recordStart":14,"recordEnd":23}}'

    def test_erroneous_status_code
      param_check = lambda { |url, query|
        assert_equal(SEARCH_URL, url)
        assert_equal(TEST_QUERY, query)
        Net::HTTPResponse.new('1.1', 400, '{"foo":"bar"}')
      }


      bridge = Groupby::Bridge.new(CLIENT_KEY, HOST, PORT)

      query = Groupby::Query.new

      bridge.stub(:execute, param_check) do
        bridge.search(query)
      end
    end

  end
end