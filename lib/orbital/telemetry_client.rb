require 'orbital/defaults'

module Orbital
  class TelemetryClient
    def initialize(http_client: HTTPClient.new,
                   observer_latitude: DEFAULT_LATITUDE,
                   observer_longitude: DEFAULT_LONGITUDE,
                   observer_altitude: DEFAULT_ALTITUDE,
                   base_url: "https://www.n2yo.com/rest/v1/satellite",
                   api_key: "")
      @http_client = http_client
      @observer_latitude = observer_latitude
      @observer_longitude = observer_longitude
      @observer_altitude = observer_altitude
      @base_url = base_url
      @api_key = api_key
    end

    def radio_passes(norad_id,
                     minimum_elevation: DEFAULT_MINIMUM_ELEVATION,
                     no_of_days: DEFAULT_NUMBER_OF_DAYS)
      request_url = "#{base_url}/radiopasses/#{norad_id}/#{observer_latitude}/#{observer_longitude}/#{observer_altitude}/#{no_of_days}/#{minimum_elevation}&apiKey=#{api_key}"
      http_client.get(request_url)
    end

    private

    attr_reader :http_client, :observer_latitude, :observer_longitude, :observer_altitude, :base_url, :api_key

  end
end

