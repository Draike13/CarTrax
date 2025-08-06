class Parts::TireType < ApplicationRecord
  self.table_name = "tire_types"
  has_many :car_specs
  has_many :tire_services, class_name: "Jobs::TireService"
end
