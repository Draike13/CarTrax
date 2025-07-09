class Parts::TransmissionFluidType < ApplicationRecord
  self.table_name = "transmission_fluid_types"
  has_many :car_specs
  has_many :transmission_services, class_name: "Jobs::TransmissionService"
end
