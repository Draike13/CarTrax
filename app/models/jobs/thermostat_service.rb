class Jobs::ThermostatService < ApplicationRecord
  self.table_name = "thermostat_services"
  has_one :job_assignment, as: :job
  has_one :service_record, through: :job_assignment
  belongs_to :thermostat, class_name: "Parts::Thermostat"
end
