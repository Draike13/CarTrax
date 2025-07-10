class Jobs::ExhaustService < ApplicationRecord
  self.table_name = "exhaust_services"
  has_one :job_assignment, as: :job
  has_one :service_record, through: :job_assignment
end
