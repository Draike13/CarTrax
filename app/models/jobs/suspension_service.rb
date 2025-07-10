class Jobs::SuspensionService < ApplicationRecord
  self.table_name = "suspension_services"
  has_one :job_assignment, as: :job
  has_one :service_record, through: :job_assignment
  belongs_to :shocks_strut, class_name: "Parts::ShocksStrut"
end
