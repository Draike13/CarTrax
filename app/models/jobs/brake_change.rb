class Jobs::BrakeChange < ApplicationRecord
  self.table_name = "brake_changes"
  has_one :job_assignment, as: :job
  has_one :service_record, through: :job_assignment
  belongs_to :brake_rotor, class_name: "Parts::BrakeRotor"
  belongs_to :brake_fluid, class_name: "Parts::BrakeFluid"
  belongs_to :brake_pad, class_name: "Parts::BrakePad"
end
