require 'httparty'

module Orbital
  class HTTPClient
    def get(request_url)
      HTTParty.get(request_url, format: :plain)
    end
  end
end

