class Jobs::HeadGasketReplacement < ApplicationRecord
  self.table_name = "head_gasket_replacements"
  has_one :job_assignment, as: :job
  has_one :service_record, through: :job_assignment
  belongs_to :head_gasket, class_name: "Parts::HeadGasket"
end
