class Jobs::FuelPumpService < ApplicationRecord
  self.table_name = "fuel_pump_services"
  belongs_to :service_record
end
