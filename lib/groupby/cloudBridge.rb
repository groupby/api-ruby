module Groupby
  class CloudBridge < AbstractBridge

    # string constants
    DOT = '.'
    CLOUD_HOST = 'groupbycloud.com'
    CLOUD_PORT = 443
    CLOUD_PATH = '/api/v1'

    def initialize(client_key, customer_id)
      super(client_key, HTTPS + customer_id + DOT + CLOUD_HOST + COLON + CLOUD_PORT + CLOUD_PATH)
    end

  end
end