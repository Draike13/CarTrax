class Jobs::AlternatorService < ApplicationRecord
  self.table_name = "alternator_services"
  has_one :job_assignment, as: :job
  has_one :service_record, through: :job_assignment
end
