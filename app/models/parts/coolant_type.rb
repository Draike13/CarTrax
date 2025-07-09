class Parts::CoolantType < ApplicationRecord
  has_many :car_specs
  has_many :coolant_services, class_name: "Jobs::CoolantService"
end
