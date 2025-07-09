class Parts::Headlight < ApplicationRecord
  has_many :car_specs
  has_many :light_services, class_name: "Jobs::LightService"
end
