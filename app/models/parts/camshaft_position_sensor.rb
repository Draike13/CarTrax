class Parts::CamshaftPositionSensor < ApplicationRecord
  self.table_name = "camshaft_position_sensors"
  has_many :electrical_timing_services, class_name: "Jobs::ElectricalTimingService"
end
