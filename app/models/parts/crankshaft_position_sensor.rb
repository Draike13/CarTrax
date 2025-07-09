class Parts::CrankshaftPositionSensor < ApplicationRecord
  self.table_name = "crankshaft_position_sensors"
  has_many :electrical_timing_services, class_name: "Jobs::ElectricalTimingService"
end
