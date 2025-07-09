class Parts::Headlight < ApplicationRecord
  self.table_name = "headlights"
  has_many :car_specs
  has_many :light_services, class_name: "Jobs::LightService"
end
