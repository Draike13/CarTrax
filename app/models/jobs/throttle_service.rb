class Jobs::ThrottleService < ApplicationRecord
  self.table_name = "throttle_services"
  has_one :job_assignment, as: :job
  has_one :service_record, through: :job_assignment
  belongs_to :throttle_position_sensor, class_name: "Parts::ThrottlePositionSensor"
end
