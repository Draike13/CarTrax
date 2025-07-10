class Jobs::WiperBladeService < ApplicationRecord
  self.table_name = "wiper_blade_services"
  has_one :job_assignment, as: :job
  has_one :service_record, through: :job_assignment
  belongs_to :wiper_blade_size, class_name: "Parts::WiperBladeSize"
end
