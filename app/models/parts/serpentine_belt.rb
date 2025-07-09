class Parts::SerpentineBelt < ApplicationRecord
  self.table_name = "serpentine_belts"
  has_many :car_specs
  has_many :belt_services, class_name: "Jobs::BeltService"
end
