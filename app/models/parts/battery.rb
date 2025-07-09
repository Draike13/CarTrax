class Parts::Battery < ApplicationRecord
  has_many :car_specs
  has_many :battery_services, class_name: "Jobs::BatteryService"
end
