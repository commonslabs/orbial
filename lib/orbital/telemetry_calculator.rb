module Orbital
  class TelemetryCalculator
    def initialize(telemetry_client:, telemetry_parser:)
      @telemetry_client = telemetry_client
      @telemetry_parser = telemetry_parser
    end

    def calculate_radio_passes(norad_id:)
      telemetry_data = telemetry_client.radio_passes(norad_id)
      return telemetry_parser.parse(telemetry_data)
    end

    private

    attr_reader :telemetry_client, :telemetry_parser
  end
end

