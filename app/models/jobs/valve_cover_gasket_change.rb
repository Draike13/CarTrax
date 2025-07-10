class Jobs::ValveCoverGasketChange < ApplicationRecord
  self.table_name = "valve_cover_gasket_changes"
  has_one :job_assignment, as: :job
  has_one :service_record, through: :job_assignment
  belongs_to :valve_cover_gasket, class_name: "Parts::ValveCoverGasket"
end
