module Orbital
  class App
    def initialize(telemetry_calculator:)
      @telemetry_calculator = telemetry_calculator
    end

    def execute(norad_id)
      telemetry_calculator.calculate_radio_passes(norad_id: norad_id)
    end

    private

    attr_reader :telemetry_calculator

  end
end

