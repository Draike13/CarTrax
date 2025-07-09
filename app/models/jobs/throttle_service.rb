class Jobs::ThrottleService < ApplicationRecord
  belongs_to :service_record
  belongs_to :throttle_position_sensor, class_name: "Parts::ThrottlePositionSensor"
end
