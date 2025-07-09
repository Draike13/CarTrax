class Parts::Taillight < ApplicationRecord
  self.table_name = "taillights"
  has_many :car_specs
  has_many :light_services, class_name: "Jobs::LightService"
end
