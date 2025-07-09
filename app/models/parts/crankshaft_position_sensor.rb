class Parts::CrankshaftPositionSensor < ApplicationRecord
  has_many :electrical_timing_services, class_name: "Jobs::ElectricalTimingService"
end
