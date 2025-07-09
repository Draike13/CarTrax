class Parts::TransmissionFluidType < ApplicationRecord
  has_many :car_specs
  has_many :transmission_services, class_name: "Jobs::TransmissionService"
end
