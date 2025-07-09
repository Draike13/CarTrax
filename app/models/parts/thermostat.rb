class Parts::Thermostat < ApplicationRecord
  self.table_name = "thermostats"
  has_many :car_specs
  has_many :thermostat_services, class_name: "Jobs::ThermostatService"
end
