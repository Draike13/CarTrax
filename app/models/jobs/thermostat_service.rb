class Jobs::ThermostatService < ApplicationRecord
  self.table_name = "thermostat_services"
  belongs_to :service_record
  belongs_to :thermostat, class_name: "Parts::Thermostat"
end
