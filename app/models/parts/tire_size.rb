class Parts::TireSize < ApplicationRecord
  self.table_name = "tire_sizes"
  has_many :car_specs
  has_many :tire_services, class_name: "Jobs::TireService"
end
