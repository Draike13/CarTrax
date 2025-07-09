class Parts::TireBrand < ApplicationRecord
  self.table_name = "tire_brands"
  has_many :car_specs
  has_many :tire_services, class_name: "Jobs::TireService"
end
