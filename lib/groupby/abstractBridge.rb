require 'mime/types'
require 'net/http'
require 'abstraction'

module Groupby
  class AbstractBridge
    abstract

    # string constants
    SEARCH = '/search'
    CLUSTER = '/cluster'
    REFINEMENTS = '/refinements'
    HTTP = 'http://'
    HTTPS = 'https://'
    COLON = ':'
    CONTENT_TYPE = 'Content-Type'
    JSON = 'text/json'

    # string @client_key
    # string @bridge_url
    # string @bridge_cluster_url
    # string @bridge_refinement_url

    def initialize(client_key, base_url)
      @client_key = client_key
      @bridge_url = base_url + SEARCH
      @bridge_cluster_url = base_url + CLUSTER
      @bridge_refinement_url = base_url + SEARCH + REFINEMENTS
    end

    def search(query)
      content = query.get_bridge_json(@client_key)

      query(@bridge_url, content)
    end

    def refinements(query, navigation_name)
      content = query.get_bridge_refinements_json(@client_key, navigation_name)

      query(@bridge_refinement_url, content)
    end

    private def query(url, content)
      response = execute(url, content)

      if response.code >= 400
        raise RuntimeError, "Error: call to URL $url failed with status #{response.code}, response #{response}", caller
      end

      if response[CONTENT_TYPE] != JSON
        raise RuntimeError, "Error: bridge at URL $url did not return the expected JSON response, it returned: #{response.content_type} instead", caller
      end

      response_body = response.body
      if response['content-encoding'] == 'gzip'
        zip_stream = Zlib::Inflate.new
        zip_buffer = zip_stream.inflate(response_body)
        zip_stream.finish
        zip_stream.close
        response_body = zip_buffer
      end

      deserialize(response_body)
    end

    protected def execute(url, content)
      uri = URI(url)
      request = Net::HTTP::Post.new(uri)
      request.set_form_data(content)
      request[CONTENT_TYPE] = JSON

      Net::HTTP.start(uri.hostname, uri.port) do |http|
        http.request(request)
      end
    end

    private def deserialize(json)
#TODO catch exceptions?
      Model::Results.from_json(json)
    end

  end
end