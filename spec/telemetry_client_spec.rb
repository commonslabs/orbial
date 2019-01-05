require 'orbital/telemetry_client'
require 'orbital/http_client'

RSpec.describe Orbital::TelemetryClient do
  describe "#radio_passes" do
    it "returns telemetry data as string" do
      base_url = "telemetry.com"
      api_key = "0"
      observer_latitude = "1"
      observer_longitude = "2"
      observer_altitude = "3"
      http_client = instance_double(Orbital::HTTPClient)
      norad_id = "4"
      minimum_elevation = "5"
      no_of_days = "6"
      no_of_days = "6"

      http_client_response = "telemetry data string"

      request = "#{base_url}/radiopasses/#{norad_id}/#{observer_latitude}/#{observer_longitude}/#{observer_altitude}/#{no_of_days}/#{minimum_elevation}&apiKey=#{api_key}"

      allow(http_client).to receive(:get).with(request).and_return(http_client_response)

      telemetry_client = Orbital::TelemetryClient.new(http_client: http_client,
                                                      observer_latitude: observer_latitude,
                                                      observer_longitude: observer_longitude,
                                                      observer_altitude: observer_altitude,
                                                      base_url: base_url,
                                                      api_key: api_key)

      result = telemetry_client.radio_passes(norad_id, minimum_elevation: minimum_elevation, no_of_days: no_of_days)

      expect(result).to eq(http_client_response)
    end
  end
end
