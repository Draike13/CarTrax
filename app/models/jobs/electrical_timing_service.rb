class Jobs::ElectricalTimingService < ApplicationRecord
  self.table_name = "electrical_timing_services"
  belongs_to :service_record
  belongs_to :vvt_solenoid, class_name: "Parts::VvtSolenoid"
  belongs_to :camshaft_position_sensor, class_name: "Parts::CamshaftPositionSensor"
  belongs_to :crankshaft_position_sensor, class_name: "Parts::CrankshaftPositionSensor"
end
