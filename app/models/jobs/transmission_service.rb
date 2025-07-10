class Jobs::TransmissionService < ApplicationRecord
  self.table_name = "transmission_services"
  has_one :job_assignment, as: :job
  has_one :service_record, through: :job_assignment
  belongs_to :transmission_fluid_type, class_name: "Parts::TransmissionFluidType"
  belongs_to :transmission_fluid_quantity, class_name: "Parts::TransmissionFluidQuantity"
end
