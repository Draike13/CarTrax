class Parts::SerpentineBelt < ApplicationRecord
  has_many :car_specs
  has_many :belt_services, class_name: "Jobs::BeltService"
end
