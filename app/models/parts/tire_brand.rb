class Parts::TireBrand < ApplicationRecord
  has_many :car_specs
  has_many :tire_services, class_name: "Jobs::TireService"
end
