class Parts::ThrottlePositionSensor < ApplicationRecord
  self.table_name = "throttle_position_sensors"
  has_many :throttle_services, class_name: "Jobs::ThrottleService"
end
