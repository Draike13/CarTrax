class Parts::VvtSolenoid < ApplicationRecord
  self.table_name = "vvt_solenoids"
  has_many :electrical_timing_services, class_name: "Jobs::ElectricalTimingService"
end
