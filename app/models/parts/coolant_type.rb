class Parts::CoolantType < ApplicationRecord
  self.table_name = "coolant_types"
  has_many :car_specs
  has_many :coolant_services, class_name: "Jobs::CoolantService"
end
