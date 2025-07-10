class Jobs::BatteryService < ApplicationRecord
  self.table_name = "battery_services"
  has_one :job_assignment, as: :job
  has_one :service_record, through: :job_assignment
  belongs_to :battery, class_name: "Parts::Battery"
end
