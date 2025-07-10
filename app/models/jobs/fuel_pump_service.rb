class Jobs::FuelPumpService < ApplicationRecord
  self.table_name = "fuel_pump_services"
  has_one :job_assignment, as: :job
  has_one :service_record, through: :job_assignment
end
