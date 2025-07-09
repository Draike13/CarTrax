class Jobs::BatteryService < ApplicationRecord
  self.table_name = "battery_services"
  belongs_to :service_record
  belongs_to :battery, class_name: "Parts::Battery"
end
