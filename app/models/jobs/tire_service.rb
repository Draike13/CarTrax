class Jobs::TireService < ApplicationRecord
  self.table_name = "tire_services"
  has_one :job_assignment, as: :job
  has_one :service_record, through: :job_assignment
  belongs_to :tire_type, class_name: "Parts::TireType"
  belongs_to :tire_size, class_name: "Parts::TireSize"
end
