require 'orbital/telemetry_calculator'
require 'orbital/telemetry_client'
require 'orbital/telemetry_parser'

RSpec.describe Orbital::TelemetryCalculator do
  describe '#calculate' do
    it "returns an array of telemetry data" do
      telemetry_client = instance_double(Orbital::TelemetryClient)
      telemetry_parser = instance_double(Orbital::TelemetryParser)

      telemetry_calculator = Orbital::TelemetryCalculator.new(telemetry_client: telemetry_client,
                                                              telemetry_parser: telemetry_parser)

      telemetry = ["start_time1", "start_time2"]
      norad_id = 1

      allow(telemetry_client).to receive(:radio_passes).with(norad_id).and_return("json_string")
      allow(telemetry_parser).to receive(:parse).with("json_string").and_return(telemetry)

      result = telemetry_calculator.calculate_radio_passes(norad_id: norad_id)

      expect(result).to eq(telemetry)
    end
  end
end

