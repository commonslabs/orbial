require 'orbital/app'
require 'orbital/telemetry_calculator'

RSpec.describe Orbital::App do
  describe "execute" do
    it "retrieves satellite JSON data" do
      telemetry_calculator = instance_double(Orbital::TelemetryCalculator)

      app = Orbital::App.new(telemetry_calculator: telemetry_calculator)

      norad_id = 1
      expect(telemetry_calculator).to receive(:calculate_radio_passes).with(norad_id: norad_id)

      app.execute(norad_id)
    end
  end
end
