class Parts::Thermostat < ApplicationRecord
  has_many :car_specs
  has_many :thermostat_services, class_name: "Jobs::ThermostatService"
end
