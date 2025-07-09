class Parts::Battery < ApplicationRecord
  self.table_name = "batteries"
  has_many :car_specs
  has_many :battery_services, class_name: "Jobs::BatteryService"
end
