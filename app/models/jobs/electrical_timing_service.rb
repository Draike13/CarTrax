class Jobs::ElectricalTimingService < ApplicationRecord
  self.table_name = "electrical_timing_services"
  has_one :job_assignment, as: :job
  has_one :service_record, through: :job_assignment
  belongs_to :vvt_solenoid, class_name: "Parts::VvtSolenoid"
  belongs_to :camshaft_position_sensor, class_name: "Parts::CamshaftPositionSensor"
  belongs_to :crankshaft_position_sensor, class_name: "Parts::CrankshaftPositionSensor"
end
