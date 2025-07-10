class Jobs::CoolantService < ApplicationRecord
  self.table_name = "coolant_services"
  has_one :job_assignment, as: :job
  has_one :service_record, through: :job_assignment
  belongs_to :coolant, class_name: "Parts::Coolant"
end
