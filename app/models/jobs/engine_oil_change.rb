class Jobs::EngineOilChange < ApplicationRecord
  self.table_name = "engine_oil_changes"
  has_one :job_assignment, as: :job
  has_one :service_record, through: :job_assignment
  belongs_to :oil_viscosity, class_name: "Parts::EngineOilViscosity"
  belongs_to :oil_filter, class_name: "Parts::EngineOilFilter"
  belongs_to :oil_quantity, class_name: "Parts::EngineOilQuantity"
end
