class Parts::TransmissionFluidQuantity < ApplicationRecord
  self.table_name = "transmission_fluid_quantities"
  has_many :car_specs
  has_many :transmission_services, class_name: "Jobs::TransmissionService"
end
