class Parts::ThrottlePositionSensor < ApplicationRecord
  has_many :throttle_services, class_name: "Jobs::ThrottleService"
end
