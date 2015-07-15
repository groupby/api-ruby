module Groupby
  class Bridge < AbstractBridge

    def initialize(client_key, bridge_host, bridge_port)
      super(client_key, "#{HTTP}#{bridge_host}#{COLON}#{bridge_port}")
    end

  end
end