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
    TEST_QUERY = '{"sort":[],"fields":[],"orFields":[],"refinements":[],"customUrlParams":[],' +
        '"pruneRefinements":true,"wildcardSearchEnabled":false,"clientKey":"randomkey","skip":0,"pageSize":10}'
    TEST_RESPONSE = '{"query":"foobar","pageInfo":{"recordStart":14,"recordEnd":23}}'

    def setup
      @response = Net::HTTPResponse.new(1.1, 200, '')
      @response['Content-Type'] = 'application/json'
      @bridge = Groupby::Bridge.new(CLIENT_KEY, HOST, PORT)
      @query = Groupby::Query.new
    end

    def test_erroneous_status_code
      response = Net::HTTPResponse.new(1.1, 400, '')

      assert_raises(RuntimeError) {
        begin
          @bridge.stub(:execute, param_check(response)) do
            @bridge.search(@query)
          end
        rescue RuntimeError => e
          refute(e.message.include?('404'), 'expected status code 400, found 404')
          raise e
        end
      }
    end

    def test_error_on_return_binary
      @response['Content-Type'] = 'application/bson'

      assert_raises(RuntimeError) {
        @bridge.stub(:execute, param_check(@response)) do
          @bridge.search(@query)
        end
      }
    end

    def test_search
      @bridge.stub(:execute, param_check(@response)) do
        @response.stub(:body, '{"query":"foobar"}') do
          results = @bridge.search(@query)
          assert_equal('foobar', results.query)
        end
      end
    end

    def test_search_gzip_response
      @response['Content-Encoding'] = 'gzip'

      json_gz = Zlib::Deflate.deflate('{"query":"foobar"}', Zlib::NO_FLUSH)

      @bridge.stub(:execute, param_check(@response)) do
        @response.stub(:body, json_gz) do
          results = @bridge.search(@query)
          assert_equal('foobar', results.query)
        end
      end
    end

    def test_search_refinements
      refinement_query = '{"originalQuery":' + TEST_QUERY + ',"navigationName":"height"}'

      param_check = lambda { |url, query|
        assert_equal(REFINEMENT_SEARCH_URL, url)
        assert_equal(refinement_query, query)
        @response
      }

      @bridge.stub(:execute, param_check) do
        @response.stub(:body, '{"navigation":{"name":"foobar"}}') do
          results = @bridge.refinements(@query, 'height')
          nav = results.navigation
          assert_equal('foobar', nav.name)
        end
      end
    end

    private def param_check(response)
      lambda { |url, query|
        assert_equal(SEARCH_URL, url)
        assert_equal(TEST_QUERY, query)
        response
      }
    end

  end
end