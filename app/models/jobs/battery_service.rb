class Jobs::BatteryService < ApplicationRecord
  belongs_to :service_record
  belongs_to :battery, class_name: "Parts::Battery"
end
