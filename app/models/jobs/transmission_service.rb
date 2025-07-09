class Jobs::TransmissionService < ApplicationRecord
  belongs_to :service_record
  belongs_to :transmission_fluid_type, class_name: "Parts::TransmissionFluidType"
  belongs_to :transmission_fluid_quantity, class_name: "Parts::TransmissionFluidQuantity"
end
